class Equipment < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :notes, presence: true, length: { maximum: 140 }
  validates :name, presence: true, length: { maximum: 20 }
  validates :make, presence: true, length: { maximum: 10 }
  validates :model, presence: true, length: { maximum: 10 }
  validates :year, presence: true, length: { maximum: 4 }
  validates :value, presence: true, length: { maximum: 8 }
  validates :category, presence: true, length: { maximum: 10 }


end
