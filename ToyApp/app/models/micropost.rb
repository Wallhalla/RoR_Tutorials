class Micropost < ActiveRecord::Base
  
  # makes sure a microposts maximum length is 140 and is not plain text
  validates :content, 
    length: {maximum: 140},
    presence: true
    
  validates :user_id,
    presence: true
  
  # associate a microsoft with a user
  belongs_to :user
end
