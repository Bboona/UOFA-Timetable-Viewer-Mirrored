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
        redirect_to '/teachers/weekly/1'
      end
    end


  end
end
