class ChangeCropTable < ActiveRecord::Migration
  def change
    croptype
    variety
       t.string   "herbicides"
    t.string   "fungicides"
    t.integer  "actual_seeded"
    t.integer  "total_produced"
    t.integer  "yield"
    t.integer  "field_id"
    t.integer  "grade"
    t.integer  "nitrogen"
    t.integer  "phosphorous"
    t.integer  "potassium"
    t.integer  "sulfur"
    t.integer  "years"
    t.date     "date_seeded"
  end
end
