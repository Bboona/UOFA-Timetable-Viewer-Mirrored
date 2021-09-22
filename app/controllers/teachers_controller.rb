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
    @test = Activity.where(class_name: "Meeting")
    if (params.has_key?(:date))
      puts("---------------------------------")
      puts("---------------------------------")
      puts("---------------------------------")
      puts("---------------------------------")
      puts("---------------------------------")
      puts("---------------------------------")
      meeting_date = Date.parse(params[:date])
      meeting_week = meeting_date.strftime("%W").to_i - 1
      meeting_week_binary = 2 ** meeting_week
      meeting_day = meeting_date.cwday - 1
      meeting_day_binary = 2 ** meeting_day

      start_time = params[:start_time]
      start_hour = start_time[0..1].to_i
      start_minute = start_time[3..4].to_i
      start_power = start_hour * 2 + 1
      if (start_minute == 30)
        start_power += 1
      end

      end_time = params[:end_time]
      end_hour = end_time[0..1].to_i
      end_minute = end_time[3..4].to_i
      end_power = end_hour * 2 + 1
      if (end_minute == 30)
        end_power += 1
      end
      puts("---------------------------------")

      time_binary = 0
      for i in start_power...end_power+1
        time_binary += 2 ** i
      end
      hamming_weight = end_power + 1 - start_power

      puts(time_binary)
      puts("---------------------------------")
      puts("---------------------------------")
      puts("---------------------------------")
      puts("---------------------------------")
      puts("---------------------------------")
      @new_meeting = Activity.create(class_name: "Meeting", class_code: "0000", colour: "00FFFF", subject: "Meeting",
                                     term: "S2", weeks: meeting_week_binary.to_s, days: meeting_day_binary.to_s,
                                     hours: time_binary.to_s, location: "Room 1", size: "2", available: "2",
                                     class_nbr: "Class number", class_type: "Meeting", hamming_weight: hamming_weight.to_s)
      redirect_to teachers_add_meeting_path
    end

  end
  # GET /teachers/weekly/:id
  def weekly

    @weekly = Weekly.where(:id => params[:id]).first
    week_bit = @weekly.week.to_i
    @activities = Teacher.first.activities
    @this_week =[]
    @hours = [65536,131072,262144,524288,1048576,2097152,4194304,8388608,16777216,33554432,67108864,134217728,268435456,536870912,1073741824,2147483648]
    @activities.each do |activity|
      activity_week_bit = activity.weeks.to_i
      if activity_week_bit&week_bit==week_bit &&
        @this_week << activity
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
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:uni_id, :first_name, :last_name)
    end
end
