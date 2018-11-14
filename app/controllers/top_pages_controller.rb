class TopPagesController < ApplicationController
  def home
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
