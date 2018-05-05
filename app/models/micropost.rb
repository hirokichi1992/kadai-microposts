class Micropost < ApplicationRecord
  validates :user_id, presence: true 
  validates :content, presence: true, length: { maximum: 255}
  belongs_to :user
  
  has_many :favorites
  has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'user_id'
  has_many :favored_users, through: :reverses_of_favorite, source: :user
end
