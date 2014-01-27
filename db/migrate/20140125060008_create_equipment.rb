class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :notes
      t.integer :user_id
      t.string :name
      t.string :make
      t.string :model
      t.integer :year
      t.integer :value
      t.string :type

      t.timestamps
    end
     add_index :equipment, [:user_id, :created_at]
  end
end
