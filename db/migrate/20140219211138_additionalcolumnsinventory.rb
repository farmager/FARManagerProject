class Additionalcolumnsinventory < ActiveRecord::Migration
  def change
    add_column :inventories, :cropyear, :integer
    add_column :inventories, :bin, :string
    add_column :inventories, :commodity_variety, :string
    add_column :inventories, :harvested_field, :string
    add_column :inventories, :status, :string
    add_column :inventories, :price, :string
  end
end
