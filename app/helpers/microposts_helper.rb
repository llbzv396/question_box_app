module MicropostsHelper
  def favorite?(user, micropost)
    Favorite.find_by(user_id: user.id, micropost_id: micropost.id)
  end
end
