class CreateCrops < ActiveRecord::Migration
  def change
    create_table :crops do |t|
      t.string :type
      t.string :variety

      t.timestamps
    end
  end
end
