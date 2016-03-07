class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  def current_user
    clear_null_session
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/login' unless current_user
  end

  def logged_in?
    !!current_user
  end

  def clear_null_session
    if session[:user_id]
      session[:user_id] = nil if User.find(session[:user_id]).nil?
    end
  end

end
