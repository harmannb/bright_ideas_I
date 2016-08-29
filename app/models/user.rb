class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :likes
  has_many :liked_ideas, through: :likes, source: :idea

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, :alias, presence: true

  validates :email, presence: true, :format => { :with => email_regex }, :uniqueness => {:case_sensitive => false}

  validates :password, confirmation: true

  validates :password, length: { minimum: 8 }
end
