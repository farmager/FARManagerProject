class Addtofieldstable < ActiveRecord::Migration
  def change
    add_column :fields, :landlocation, :string
    add_column :crops, :nitrogen, :integer
    add_column :crops, :phosphorous, :integer
    add_column :crops, :potassium, :integer
    add_column :crops, :sulfur, :integer
    add_column :crops, :years, :integer
  end
end
