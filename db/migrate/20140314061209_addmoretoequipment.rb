class Addmoretoequipment < ActiveRecord::Migration
  def change
    
    add_column :equipment, :maintenance_date, :date
    
    add_column :equipment, :next_maintenance_date, :date
    
    add_column :equipment, :mileage_or_engine_hours, :integer
    
    add_column :equipment, :maintenance_notes, :string
    
    add_column :equipment, :maintenance_data, :integer



    
    add_column :observations, :observation_specific, :string
  end
end
