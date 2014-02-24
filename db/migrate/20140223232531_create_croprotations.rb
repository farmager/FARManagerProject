class CreateCroprotations < ActiveRecord::Migration
  def change
    create_table :croprotations do |t|
  
      t.integer :user_id
      t.string :land_location
      t.string :planned_crop_year1
      t.string :year1
      t.string :planned_crop_year2
      t.string :year2
      t.string :planned_crop_year3
      t.string :year3
      t.timestamps
    end
  end
end
