class User < ActiveRecord::Base
  has_secure_password
  validates :username, uniqueness: true
  has_many :workouts
  has_many :exercises, through: :workouts
end
