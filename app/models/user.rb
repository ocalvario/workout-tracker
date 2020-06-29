class User < ActiveRecord::Base
  has_many :workout
  has_secure_password 
end
