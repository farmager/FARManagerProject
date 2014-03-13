class ExpensesController < ApplicationController
  before_action :signed_in_user
  
 def new
  @expense=Expense.new  
  end
  
  
  def destroy
      Expense.find(params[:id]).destroy
    flash[:success] = "Tax Year successfully deleted."
    redirect_to expenses_url
    
  end
  
   def edit
     @expense = Expense.find(params[:id])
  end
  
    def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(expense_params)
      flash[:success] = "Tax Year successfully updated!"
      redirect_to @expense
    else
      render 'expense'
    end
  end
  
  
   
  def show
    @expense = Expense.find(params[:id])
  end
  
    def create
       @expense = current_user.expense.build(expense_params)
    # @equipment = Equipment.new(equipment_params)
    if @expense.save
      flash[:success] = "Tax Year added successfully!"
      redirect_to @expense
    else
      render 'new'
    end
  end
  
  
  def index
    @expense = current_user.expense.paginate(page: params[:page])
  end  
  

  private
  

    def expense_params
      params.require(:expense).permit(:notes,:gross_income,:total_expenses,:total_taxable,:tax_owed,:telephone,:subscription_costs,:office_expenses,:accounting_legalfees,:property_taxes,:rents,:vehicle_expenses,:hardware_costs,:heating_fuel,:machinery_repairs,:building_repairs,:machinery_rent,:interest,:year,:pulse,:cereals,:canola,:rents,:flax,:fertilizer,:chemicals,:insurancepremium,:machinery_fuel,:electricity,:trucking)
    end
  
  
end
