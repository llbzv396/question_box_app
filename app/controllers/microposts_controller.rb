class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private

  def micropost_params
    params.require(:micropost).permit(:question, :answer)
  end
end
