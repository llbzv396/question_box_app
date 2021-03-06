class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id,  presence: true
  validates :question, presence: true, length: { maximum: 140 }
  validates :answer, presence: true, length: { maximum: 140 }
end
