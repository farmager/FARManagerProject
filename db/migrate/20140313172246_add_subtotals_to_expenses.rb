class AddSubtotalsToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :gross_income, :float
    
    add_column :expenses, :total_expenses, :float
    
    add_column :expenses, :total_taxable, :float
    
    add_column :expenses, :tax_owed, :float
  end
end
