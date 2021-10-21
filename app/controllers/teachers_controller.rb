class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show edit update destroy ]

  # GET /teachers or /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1 or /teachers/1.json
  def show
  end

  def add_meeting
    # Test to display all meetings
    @test = Activity.where(class_name: "Meeting")

    if (params.has_key?(:date))
      meeting_date = Date.parse(params[:date])

      # Get the week
      meeting_week = meeting_date.strftime("%W").to_i
      meeting_week_binary = 2 ** meeting_week

      # Get the day
      meeting_day = meeting_date.cwday - 1
      meeting_day_binary = 2 ** meeting_day

      # Get the start time
      start_time = params[:start_time]
      # First two characters are hour
      start_hour = start_time[0..1].to_i
      # Seocnd two characters are minute
      start_minute = start_time[3..4].to_i
      start_power = start_hour * 2 - 2
      # Round down to :00 or :30
      if (start_minute >= 30)
        start_power += 1
      end

      end_time = params[:end_time]
      end_hour = end_time[0..1].to_i
      end_minute = end_time[3..4].to_i
      end_power = end_hour * 2 - 2
      # Round up to :30 or next :00
      if (end_minute != 0)
        end_power += 1;
      end
      if (end_minute > 30)
        end_power += 1
      end

      # Convert time to binary
      time_binary = 0
      for i in start_power...end_power
        time_binary += 2 ** i
      end
      hamming_weight = end_power - start_power

      location = params[:meeting_location]
      meeting_type = params[:meeting_type]
      @new_meeting = Activity.create(class_name: "Meeting", class_code: "0000", colour: "00FFFF", subject: "Meeting",
                                     term: "S2", weeks: meeting_week_binary.to_s, days: meeting_day_binary.to_s,
                                     hours: time_binary.to_s, location: location, size: "2", available: "2",
                                     class_nbr: "Class number", class_type: meeting_type, hamming_weight: hamming_weight.to_s)
      
      # Enrol teacher with meeting
      ActivitiesTeachers.create(:teacher_id => session[:id], :activity_id => @new_meeting.id)
      

      redirect_to teachers_add_meeting_path
    end

  end
  # GET /teachers/weekly/:id
  def weekly
    @teacher = Teacher.where(:uni_id => session[:uni_id]).first
    @weekly = Weekly.where(:id => (params[:id].to_i - 9)).first
    week_bit = @weekly.week.to_i
    @activities = Teacher.where(:uni_id => session[:uni_id]).first.activities
    @this_week = Array.new(16){Array.new(7,1)}
    @time_names = ["9:00 am","","10:00 am","","11:00 am","","12:00 pm","","1:00 pm","","2:00 pm","","3:00 pm","","4:00 pm","",]
    @day_bits = [1,2,4,8,16,32,64]
    @hours = [65536,131072,262144,524288,1048576,2097152,4194304,8388608,16777216,33554432,67108864,134217728,268435456,536870912,1073741824,2147483648]
    @act_details = []
    @clashes = []
    @day_bits.each_with_index do |day,i|
      @hours.each_with_index do |time,j|
        @activities.each do |act|
          if act.weeks.to_i & week_bit == week_bit && act.hours.to_i & time == time && act.days.to_i & day == day && @act_details.exclude?(act)
            if @this_week[j][i] == 1
              @act_details << act
              @this_week[j][i] = act
              @hamming_temp = act.hamming_weight
              for n in 1..@hamming_temp.to_i-1 do
                if j+n < 16
                  @this_week[j+n][i] = 0
                else
                  break
                end
              end
            else
              if @clashes.exclude?(act)
                @clashes << act
              end
            end
          end
        end
      end
    end

  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers or /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: "Teacher was successfully created." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: "Teacher was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def teacher_params
    params.require(:teacher).permit(:uni_id, :first_name, :last_name,:password)
  end
end
