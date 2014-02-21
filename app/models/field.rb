class Field < ActiveRecord::Base
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
