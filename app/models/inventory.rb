class Inventory < ActiveRecord::Base
  
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :capacity, presence: true, length: { maximum: 100000 }
  validates :commodity, presence: true

        
end
