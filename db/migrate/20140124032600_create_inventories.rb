class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :name
      t.integer :capacity
      t.string :commodity
      t.string :ticket_no
      t.integer :moisture_content
      t.string :notes
      t.integer :user_id

      t.timestamps
    end
    add_index :inventories, [:user_id, :created_at]
  end
end
