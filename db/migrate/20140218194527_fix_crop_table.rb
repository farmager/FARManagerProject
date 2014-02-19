class FixCropTable < ActiveRecord::Migration
  def change
    remove_column :crops,:seeded_date
    add_column :crops,:date_seeded,:date
    add_reference :crops,:fields,index:true
  end
end
