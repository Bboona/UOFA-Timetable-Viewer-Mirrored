class LoginsController < ApplicationController
  def index
    @wrong = "no"
    @username = params[:user_name]
    @password = params[:password]

    #uni_id #password
    @user = Teacher.where(:uni_id => @username).first

    if (!params[:user_name].nil?)
      if (@user.password == @password)
        session[:id] = @user.id

        # Get this week's number and redirect to that timetable page
        this_week = Date.today.cweek + 1;
        redirect_to ('/teachers/weekly/' + this_week.to_s)
      end
    end


  end
end
