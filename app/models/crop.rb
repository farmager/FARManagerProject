class Crop < ActiveRecord::Base


  belongs_to :field
  # validates :field_id, presence: true

end
