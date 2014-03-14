class AddEquipmentToMaintenance < ActiveRecord::Migration
  def change
    
    add_column :maintenances, :equipment_maintained, :string
  end
end
