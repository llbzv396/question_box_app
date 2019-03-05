class TopPagesController < ApplicationController
  after_action :set_url_to_session, only: [:home]

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

  private
    def set_url_to_session
      session[:url] = request.path
      p session[:url]
    end
end
