class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show edit update destroy ]

  # GET /teachers or /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1 or /teachers/1.json
  def show
  end

  # GET /teachers/weekly/:id
  def weekly

    @weekly = Weekly.where(:id => params[:id]).first
    week_bit = @weekly.week.to_i
    @activities = Teacher.first.activities
    @this_week = Array.new(16){Array.new(7,1)}
    @time_names = ["9:00 am","","10:00 am","","11:00 am","","12:00 pm","","1:00 pm","","2:00 pm","","3:00 pm","","4:00 pm","",]
    @day_bits = [1,2,4,8,16,32,64]
    @hours = [65536,131072,262144,524288,1048576,2097152,4194304,8388608,16777216,33554432,67108864,134217728,268435456,536870912,1073741824,2147483648]
    @act_details = []
    @clashes = []
    @counter = 0
    @day_bits.each_with_index do |day,i|
      @hours.each_with_index do |time,j|
        @activities.each do |act|
          if act.weeks.to_i & week_bit == week_bit && act.hours.to_i & time == time && act.days.to_i & day == day && @act_details.exclude?(act)
            @counter=@counter+1
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
      params.require(:teacher).permit(:uni_id, :first_name, :last_name)
    end
end
