class ChangesToCrop < ActiveRecord::Migration
  def change
    rename_column :crops, :type, :crop_type
    add_column :crops, :herbicides, :string
    add_column :crops, :fungicides, :string
    add_column :crops, :actual_seeded, :integer
    add_column :crops, :total_produced, :integer
    add_column :crops, :yield, :integer
    add_column :crops, :field_id, :integer
    add_column :crops, :grade, :integer
    add_column :crops, :seeded_date, :string
    
  end
end
