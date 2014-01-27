class ExpensesController < ApplicationController
  before_action :signed_in_user
  
 def new
  @expense=Expense.new  
  end
  
  
  def destroy
    
  end
  
   
  def show
    @expense = Expense.find(params[:id])
  end
  
    def create
       @expense = current_user.expense.build(expense_params)
    # @equipment = Equipment.new(equipment_params)
    if @expense.save
      flash[:success] = "Expense added successfully!"
      redirect_to @expense
    else
      render 'new'
    end
  end

  private

    def expense_params
      params.require(:expense).permit(:year)
    end
  
  
end
