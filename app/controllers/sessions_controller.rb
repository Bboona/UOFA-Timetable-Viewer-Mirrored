class SessionsController < ApplicationController
  def new
  end

  def create
    teacher = Teacher.find_by(uni_id: params[:session][:uni_id])
    student = Student.find_by(uni_id: params[:session][:uni_id])
    if student==nil && teacher==nil
      flash.now[:danger] = 'Invalid id/password combination'
      redirect_to root_url
    end
    if teacher!=nil
      if teacher && teacher.authenticate(params[:session][:password])
        session[:teacher_uni_id] = teacher.uni_id
        session[:forwarding_url] = request.original_url if request.get?
        redirect_to(session[:forwarding_url] || teacher)
        session.delete(:forwarding_url)



      else
        flash.now[:danger] = 'Invalid id/password combination'
        redirect_to root_url
      end
    end

    if student!=nil
      if  student &&  student.authenticate(params[:session][:password])
        session[:teacher_uni_id] = student.uni_id
        session[:forwarding_url] = request.original_url if request.get?
        redirect_to(session[:forwarding_url] || student)
        session.delete(:forwarding_url)



      else
        flash.now[:danger] = 'Invalid id/password combination'
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

