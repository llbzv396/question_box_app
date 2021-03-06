class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :destroy]
  after_action :set_url_to_session, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "User Registration Completed!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleting completed!"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_url_to_session
    session[:url] = request.path
    p session[:url]
  end
end
