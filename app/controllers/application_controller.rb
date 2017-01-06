class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def log_in(user)
  	session[:user_id] = user.id
  end

  private

  def check_login
      redirect_to root_path unless logged_in?
  end

  def logged_in?
  	!!current_user
  end

  def current_user
  	@current_user ||= User.find_by_id(session[:user_id]) 
  end

  helper_method :current_user, :logged_in?
end
