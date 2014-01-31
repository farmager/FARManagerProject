class Addmoretofields < ActiveRecord::Migration
  def change
    add_column :fields, :acres, :integer
    add_column :fields, :status, :integer
    add_column :fields, :notes, :string
    add_column :fields, :total_acres, :integer
  end
end
