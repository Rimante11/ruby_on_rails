class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update] #pga vi tog bort commenterat bort

  def show
    #@user = User.find(params[:id])   pga before_action
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def edit
    #@user = User.find(params[:id]) pga before_action
  end

  def update
    #@user = User.find(params[:id])  pga before_action
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
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

  def set_user
    @user = User.find(params[:id]) #pga before_action
  end

end