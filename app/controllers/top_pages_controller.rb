class TopPagesController < ApplicationController
  def home
    @user = User.find_by(id: session[:user_id])
    @micropost = current_user.microposts.build if logged_in?
    @microposts = Micropost.all.includes(:user)
  end

  def help
  end

  def about
  end

  def contact
  end
end
