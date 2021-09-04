class TeachersController < ApplicationController
  def index

  end

  def weekly
    @oneweek = Weekly.all
    @weekly = Weekly.where(:id => params[:id]).first
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
end
