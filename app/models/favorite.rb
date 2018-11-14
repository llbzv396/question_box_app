class Favorite < ApplicationRecord
  validates :user_id, presence: true
  validates :micropost_id, presence: true
end
