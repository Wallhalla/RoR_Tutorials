class User < ActiveRecord::Base
  
  
  # associate a user with microposts
  has_many :microposts
end
