class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :fields, [:user_id, :created_at]
  end
end
