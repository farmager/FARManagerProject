class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.integer :user_id
      t.string :name
      t.integer :capacity
      t.string :group
      t.string :notes
      t.string :rent_or_own

      t.timestamps
    end
  end
end
