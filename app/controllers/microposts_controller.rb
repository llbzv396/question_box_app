class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @microposts = Micropost.all.includes(:user)
      render 'top_pages/home'
    end
  end

  def destroy
    Micropost.find(params[:id]).destroy
    flash[:success] = "Post deleting completed!"
    redirect_to root_path
  end

  private

  def micropost_params
    params.require(:micropost).permit(:question, :answer)
  end
end
