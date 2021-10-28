require 'date'

class SessionsController < ApplicationController
  def new
    unless session[:uni_id].nil?
      teacher = Teacher.find_by(uni_id: session[:uni_id])
      admin = Admin.find_by(uni_id: session[:uni_id])

      if admin
        redirect_to ('/admins')
      else 
        # Redirect to current week
        date = Date.today
        week = date.cweek + 1

        user_val = teacher ? 'teachers' : 'students'

        redirect_to( '/' + user_val + '/weekly/' + week.to_s)
      end
    end
  end

  def create
    teacher = Teacher.find_by(uni_id: params[:session][:uni_id])
    student = Student.find_by(uni_id: params[:session][:uni_id])
    admin = Admin.find_by(uni_id: params[:session][:uni_id])
    if student==nil && teacher==nil && admin==nil
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

    if admin!=nil
      if  admin &&  admin.authenticate(params[:session][:password])
        session[:uni_id] = admin.uni_id

        # Redirect to admins
        redirect_to('/admins')


      else
        flash[:danger] = 'Invalid id/password combination'
        redirect_to root_url
      end
    end
  end

  def destroy
    session.delete(:uni_id)
    @current_teacher = nil
    redirect_to root_url
  end
end

