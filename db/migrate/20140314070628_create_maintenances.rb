class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.integer :user_id
      t.date :maintenance_date
      t.date :next_maintenance_date
      t.string :maintenance_notes
      t.integer :mainteance_data
      t.float :maintenance_cost

      t.timestamps
    end
  end
end
