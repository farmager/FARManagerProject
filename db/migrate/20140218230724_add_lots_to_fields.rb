class AddLotsToFields < ActiveRecord::Migration
  def change
    
    add_column :fields, :land_location, :string
    add_column :fields, :land_name, :string
    add_column :fields, :crop_type, :string
    add_column :fields, :variety, :string
    add_column :fields, :seeding_date, :date
    add_column :fields, :f_nitrogen, :integer
    add_column :fields, :f_phosphorous, :integer
    add_column :fields, :f_sulphur, :integer
    add_column :fields, :f_potassium, :integer
    add_column :fields, :herbicides, :string
    add_column :fields, :fungicides, :string
    add_column :fields, :seeded_acres,:integer
    add_column :fields, :netyield,:integer
    add_column :fields, :grade,:integer
    add_column :fields, :production,:integer
    
    
    remove_column :fields, :total_acres
    remove_column :fields, :content
    remove_column :fields, :acres
    remove_column :fields, :status
    remove_column :fields, :landlocation
    

  end
end
