class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id, micropost_id: params[:id])
    redirect_to root_path
  end

  def destroy
    Favorite.find_by(micropost_id: params[:id]).delete
    redirect_to root_path
  end
end
