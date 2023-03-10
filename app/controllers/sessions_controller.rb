class SessionsController < ApplicationController
  
  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) #if user exists
      session[:user_id] = user.id #allows logged in user authenticate and stay logged in in all sessions
      #flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      #flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    #flash[:notice] = "Logged out"
    redirect_to root_path
  end

end