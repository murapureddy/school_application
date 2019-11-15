class LoginController < ApplicationController

  def new

  end
  def create
    teacher = Teacher.authenticate(params[:email], params[:password])
    if teacher && teacher.active == true
      session[:teacher_id] = teacher.id
      redirect_to teachers_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to login_url, notice: "Logged out!"
  end
end
