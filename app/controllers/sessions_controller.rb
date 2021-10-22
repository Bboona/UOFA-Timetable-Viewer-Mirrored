require 'date'

class SessionsController < ApplicationController
  def new
    unless session[:uni_id].nil?
      teacher = Teacher.find_by(uni_id: session[:uni_id])

      # Redirect to current week
      date = Date.today
      week = date.cweek + 1

      user_val = teacher ? 'teachers' : 'students'

      redirect_to( '/' + user_val + '/weekly/' + week.to_s)
    end
  end

  def create
    teacher = Teacher.find_by(uni_id: params[:session][:uni_id])
    student = Student.find_by(uni_id: params[:session][:uni_id])
    if student==nil && teacher==nil
      flash[:danger] = 'Invalid id/password combination'
      redirect_to root_url
    end
    if teacher!=nil
      if teacher && teacher.authenticate(params[:session][:password])
        session[:uni_id] = teacher.uni_id

        # Old redirect
        # session[:forwarding_url] = request.original_url if request.get?
        # redirect_to(session[:forwarding_url] || teacher)
        # session.delete(:forwarding_url)

        # Redirect to current week
        date = Date.today
        week = date.cweek + 1
        redirect_to('/teachers/weekly/' + week.to_s)



      else
        flash[:danger] = 'Invalid id/password combination'
        redirect_to root_url
      end
    end

    if student!=nil
      if  student &&  student.authenticate(params[:session][:password])
        session[:uni_id] = student.uni_id

        # Old redirect
        #session[:forwarding_url] = request.original_url if request.get?
        #redirect_to(session[:forwarding_url] || student)
        #session.delete(:forwarding_url)

        # Redirect to current week
        date = Date.today
        week = date.cweek + 1
        redirect_to('/students/weekly/' + week.to_s)


      else
        flash[:danger] = 'Invalid id/password combination'
        redirect_to root_url
      end
    end
  end

  def destroy
    session.delete(:teacher_id)
    @current_teacher = nil
    redirect_to root_url
  end
end

