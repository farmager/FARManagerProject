class Equipment < ActiveRecord::Base
  Paperclip.options[:command_path] = "C:\Program Files\ImageMagick-6.8.8-Q16"
  belongs_to :user
   has_attached_file :image, :default_url => "/images/:style/missing.png"
  
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
