class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to login_path, alert: "You must be logged in to access this page." if current_user.nil?
  end

  def redirect_logged_in
    redirect_to dashboard_path if !current_user.nil?
  end

  def instructors_only!
    unless current_user.user_type == User::UserTypes::INSTRUCTOR
      redirect_to root_path
    end
  end

  def dashboard_for_user(user)
    if user&.is_student?
      projects_path
    elsif user&.is_instructor?
      cohorts_path
    else
      nil
    end
  end
end
