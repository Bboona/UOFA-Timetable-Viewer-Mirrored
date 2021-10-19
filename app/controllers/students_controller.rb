class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/weekly/:id
  def weekly
    if params[:id].to_i < 1
      params[:id] = "1"
    end

    @weekly = Weekly.where(:id => params[:id]).first
    week_bit = @weekly.week.to_i
    @activities = Student.where(:uni_id => session[:uni_id]).first.activities
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
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:uni_id, :first_name, :last_name,:password)
  end
end
