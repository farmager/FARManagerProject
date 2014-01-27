class EquipmentController < ApplicationController
  
  before_action :signed_in_user
  
  def index
    
  end  
  
  def new
  @equipment=Equipment.new  
  end
  
  
  def destroy
    
  end
  
   
  def show
    @equipment = Equipment.find(params[:id])
  end
  
    def create
       @equipment = current_user.equipment.build(equipment_params)
    # @equipment = Equipment.new(equipment_params)
    if @equipment.save
      flash[:success] = "Equipment added successfully!"
      redirect_to @equipment
    else
      render 'new'
    end
  end

  private

    def equipment_params
      params.require(:equipment).permit(:name, :notes, :make,
                                   :model,:year,:value,:category)
    end
  
  
end
