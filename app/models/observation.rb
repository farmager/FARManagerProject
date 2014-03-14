class Observation < ActiveRecord::Base
  Paperclip.options[:command_path] = "C:\Program Files\ImageMagick-6.8.8-Q16"
  belongs_to :user
  has_attached_file :image, :default_url => "/app/assets/images/missing.png"

  validates :user_id, presence: true
  validates :observation_type, presence: true
  validates :landparcel, presence: true
  validates :cropobserved, presence: true
  
  OBSERVATION_TYPES = ["Hail Observation","Weed Observation","Pest Observation","Disease Observation","Frost Observation","Flooding Observation","Other Observation"]

end
