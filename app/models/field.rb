class Field < ActiveRecord::Base
  scope :thirteen, where(:year => "2013")
  
  
   def self.uniq_by_landlocation
    all.uniq_by(&:land_location)
  end
  
  belongs_to :user
  
  
  
  
  
  
 def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |field|
        csv << field.attributes.values_at(*column_names)
      end
    end
  end
 
  validates :user_id, presence: true
  
end
