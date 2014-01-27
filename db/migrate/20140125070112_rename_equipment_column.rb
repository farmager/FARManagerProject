class RenameEquipmentColumn < ActiveRecord::Migration
  def change
    rename_column :equipment, :type, :category
  end
end
