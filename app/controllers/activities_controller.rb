class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities or /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  def hamming_weight (n)
    bin_values = [[1,0]]
    while n > bin_values[0][0]
      bin_values.insert(0, [(bin_values[0][0] * 2),(bin_values[0][1] + 1)])
    end
    n_bin = []
    for i in 0..(bin_values.size - 1)
      n_bin << '0'
    end
    p n
    for val in bin_values
      if n >= val[0]
        n_bin[val[1]] = '1'
        n = n - val[0]
      else
        n_bin[val[1]] = '0'
      end
    end
    num_ones = 0
    for num in n_bin
      num == '1' ? num_ones += 1 : num_ones
    end
    return num_ones
  end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)
    @hamming = hamming_weight(@activity.hours)
    @activities.hamming_weight=@hamming

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:class_name, :class_code, :colour, :description, :weeks, :days, :hours, :hamming_weight)
    end
end
