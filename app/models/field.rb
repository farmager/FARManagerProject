class Field < ActiveRecord::Base
 
  validates :user_id, presence: true
  validates :land_location, presence: true
  

  
  # validates :land_name, length: { in: 2..20 }
  # validates :year, presence: true,numericality:true, length: { is: 4 }
  # validates :seeded_acres, presence: true, numericality: true, length: { maximum: 4 }
  # validates :notes, length: { in: 2..75 }
  # validates :crop_type, presence: true,length: { in: 2..20 }
  # validates :variety, length: { in: 2..20 }


  
  # validates :f_nitrogen, numericality: true
  # validates :f_phosphorous, numericality: true
  # validates :f_potassium, numericality: true
  # validates :f_sulphur, numericality: true
  # validates :netyield, numericality: true
  # validates :production, numericality: true

               
                
            
             
   def self.uniq_by_landlocation
    all.uniq_by(&:land_location)
  end
  
  belongs_to :user
  
  
  def render_csv(filename = nil)
  filename ||= params[:action]
  filename += '.csv'

  if request.env['HTTP_USER_AGENT'] =~ /msie/i
    headers['Pragma'] = 'public'
    headers["Content-type"] = "text/plain" 
    headers['Cache-Control'] = 'no-cache, must-revalidate, post-check=0, pre-check=0'
    headers['Content-Disposition'] = "attachment; filename=\"#{filename}\"" 
    headers['Expires'] = "0" 
  else
    headers["Content-Type"] ||= 'text/csv'
    headers["Content-Disposition"] = "attachment; filename=\"#{filename}\"" 
  end

  render :layout => false
end
  
  
  
  
 def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |field|
        csv << field.attributes.values_at(*column_names)
      end
    end
  end
 
  
  
end
