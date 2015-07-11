class User < ActiveRecord::Base
  
  validates :name,
    presence: true
  
  validates :email,
    presence: true
  
  # associate a user with microposts
  has_many :microposts
end
