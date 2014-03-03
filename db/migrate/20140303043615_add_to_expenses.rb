class AddToExpenses < ActiveRecord::Migration
  def change
    
    add_column :expenses, :notes, :string
    
    add_column :expenses, :pulse, :float
    
    add_column :expenses, :cereals, :float
    
    add_column :expenses, :canola, :float
    
    add_column :expenses, :flax, :float
    
    
    
    add_column :expenses, :fertilizer, :float
    
    add_column :expenses, :chemicals, :float
    
    add_column :expenses, :insurancepremium, :float
    
    add_column :expenses, :machinery_fuel, :float
    
    add_column :expenses, :electricity, :float
    
    add_column :expenses, :trucking, :float
    
    add_column :expenses, :heating_fuel, :float
    
    add_column :expenses, :machinery_repairs, :float
    
    add_column :expenses, :building_repairs, :float
    
    add_column :expenses, :machinery_rent, :float
    
    add_column :expenses, :interest, :float
    
    add_column :expenses, :subscription_costs, :float
    
    add_column :expenses, :office_expenses, :float
    
    add_column :expenses, :accounting_legalfees, :float
    
    add_column :expenses, :property_taxes, :float
    
    add_column :expenses, :rents, :float
    
    add_column :expenses, :vehicle_expenses, :float
    
    add_column :expenses, :hardware_costs, :float
    
    add_column :expenses, :telephone, :float
    
    
  end
end
