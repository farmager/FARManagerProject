class Field < ActiveRecord::Base
  scope :thirteen, where(:year => "2013")
  
  
  
  
  belongs_to :user
  
  
  def queries
    @fields=Field.find_by_sql "select avg(netyield) from fields where crop_type='Canola'"
  end
  
  
  
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
