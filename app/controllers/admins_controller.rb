class AdminsController < ApplicationController

  SAGov_restrictions_website = "https://www.covid-19.sa.gov.au/restrictions-and-responsibilities/activities-and-gatherings/restriction-levels"


  def index
    @all_levels = RestrictionLevel.all_levels
    @SAGov_restrictions_website = SAGov_restrictions_website
    @level_object = RestrictionLevel.first
    @level_current = @level_object[:level_current].to_s
    @level_name = @level_object[:level_name]
  end

  # get restriction level as a string
  def get_restriction_level
    @current_level = RestrictionLevel.first[:level_current].to_s
  end

  # set new restriction level
  def set_restriction_level
    @level_new_name = params[:level][:level]
    @all_levels = RestrictionLevel.all_levels
    @level_new_current = @level_new_name[0]
    current_restriction = RestrictionLevel.first
    current_restriction.update!({:level_current=>@level_new_current.to_i, :level_name=>@level_new_name})
    redirect_to admins_path
  end

  def admin_params
    params.require(:admin).permit(:level)
  end

end


