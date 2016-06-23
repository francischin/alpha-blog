class SessionsController < ApplicationController
  def new
  
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase) #find if the email exists
    #check if email exists and then authenticate
    
    if user && user.authenticate(params[:sessions][:password])
      
      session[:user_id] = user.id #saving user id into this session
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  
    
    
  end
  
  def destroy
    
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end
  

end
