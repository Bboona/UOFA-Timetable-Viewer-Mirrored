class WeekliesController < ApplicationController
  before_action :set_weekly, only: %i[ show edit update destroy ]

  # GET /weeklies or /weeklies.json
  def index
    @weeklies = Weekly.all
  end

  # GET /weeklies/1 or /weeklies/1.json
  def show
    week_bit = @weekly.week.to_i
    @activities = Activity.all
    @this_week =[]
    @hours = [65536,131072,262144,524288,1048576,2097152,4194304,8388608,16777216,33554432,67108864,134217728,268435456,536870912,1073741824,2147483648]
    @activities.each do |activity|
      activity_week_bit = activity.weeks.to_i
      if activity_week_bit&week_bit==week_bit
        @this_week << activity
      end
    end
  end
  # GET /weeklies/new
  def new
    @weekly = Weekly.new
  end

  # GET /weeklies/1/edit
  def edit
  end

  # POST /weeklies or /weeklies.json
  def create
    @weekly = Weekly.new(weekly_params)

    respond_to do |format|
      if @weekly.save
        format.html { redirect_to @weekly, notice: "Weekly was successfully created." }
        format.json { render :show, status: :created, location: @weekly }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weekly.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weeklies/1 or /weeklies/1.json
  def update
    respond_to do |format|
      if @weekly.update(weekly_params)
        format.html { redirect_to @weekly, notice: "Weekly was successfully updated." }
        format.json { render :show, status: :ok, location: @weekly }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weekly.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weeklies/1 or /weeklies/1.json
  def destroy
    @weekly.destroy
    respond_to do |format|
      format.html { redirect_to weeklies_url, notice: "Weekly was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekly
      @weekly = Weekly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weekly_params
      params.require(:weekly).permit(:week)
    end
end
