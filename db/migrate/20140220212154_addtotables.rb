class Addtotables < ActiveRecord::Migration
  def change
    add_column :observations,:date_observed,:date
    add_column :fields, :year, :integer
  end
end
