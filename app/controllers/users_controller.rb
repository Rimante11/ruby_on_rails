class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Alpha Blog #{@user.username} you signup sucssefully"
      redirect_to articles_path
    else
      render 'new'
   
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @article.errors, status: :unprocessable_entity }
   end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end