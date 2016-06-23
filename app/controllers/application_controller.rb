class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in? 
  
   
  
  def current_user
    #finding the current user
    current_user ||= User.find(session[:user_id]) if session[:user_id]  #this session[:user_id] is a session variable we got after logging in
  end
  
  def logged_in?
   !!current_user
   
  end
    
  
  def require_user
    if !logged_in?  #check if user login ?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
