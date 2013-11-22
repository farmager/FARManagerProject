class Field < ActiveRecord::Base
  belongs_to :user
  # order by newest
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 20 }
end
