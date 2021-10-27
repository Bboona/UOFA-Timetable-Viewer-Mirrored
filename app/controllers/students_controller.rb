class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy weekly ]
  before_action :admin_only, only: %i[ index show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/weekly/:id
  def weekly
    if @student.nil?
      if session[:uni_id].nil?
        redirect_to root_url
      else
        admin = Admin.find_by(uni_id: session[:uni_id])

        if admin
          redirect_to ('/admins')
        else 
          redirect_to '/teachers/weekly/' + params[:id]
        end
      end
    else
      if params[:id].to_i < 10
        params[:id] = "10"
      end
      # Converts hour bits to the representation of the hours
      def hour_bits_to_name(act)
        hour_bits = act.hours.to_i
        hours = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30",
                "06:00","06:30","07:00","07:30","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30",
                "12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30",
                "18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30",]
        counter = 1
        i = 0
        while hour_bits & counter != counter
          counter = counter * 2
          i = i + 1
        end
        hours_name = hours[i] + "-" + hours[i + act.hamming_weight.to_i]
        act.hours = hours_name
        return act
      end

      # Converts the day bits to the representation of the days
      def day_bits_to_name(act)
        day_bits = act.days.to_i
        days = ""
        if day_bits & 1 == 1
          days = days + "Monday "
        end
        if day_bits & 2 == 2
          days = days + "Tuesday "
        end
        if day_bits & 4 == 4
          days = days + "Wednesday "
        end
        if day_bits & 8 == 8
          days = days + "Thursday "
        end
        if day_bits & 16 == 16
          days = days + "Friday "
        end
        act.days = days
        return act
      end

      if params[:id].to_i < 1
        params[:id] = "1"
      end

      @weekly = Weekly.where(:id => (params[:id].to_i - 9)).first
      week_bit = @weekly.week.to_i
      @activities = @student.activities
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
                  act_with_names = act
                  act_with_names = day_bits_to_name(act_with_names)
                  act_with_names = hour_bits_to_name(act_with_names)
                  @clashes << act_with_names
                end
              end
            end
          end
        end
      end
    end
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.where(:uni_id => session[:uni_id]).first
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:uni_id, :first_name, :last_name,:password)
  end

  def admin_only
    admin = Admin.find_by(uni_id: session[:uni_id])

    unless admin 
      redirect_to root_path
    end
  end
end
