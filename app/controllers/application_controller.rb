class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    if session[:teacher_id]
      @current_user ||= Teacher.find(session[:teacher_id])
    else
      @current_user = nil
    end
  end
end
