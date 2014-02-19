class Field < ActiveRecord::Base
  belongs_to :user
  
  has_many :crops
  
  
  # order by newest
 
  validates :user_id, presence: true
  
end
