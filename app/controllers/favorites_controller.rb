class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id, micropost_id: params[:id])
    redirect_to session[:url]
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, micropost_id: params[:id]).delete
    redirect_to session[:url]
  end
end
