class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :liked_ideas, through: :likes, source: :user

  validates :idea, presence: true
end
