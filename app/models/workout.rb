class WORKOUT < ActiveRecord::Base
  has_many :exercise
  belongs_to :user
end
