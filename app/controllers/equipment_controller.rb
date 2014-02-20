class EquipmentController < ApplicationController
  
  before_action :signed_in_user
  
  def index
    @equipment = current_user.equipment.paginate(page: params[:page])
  end  
  
  def new
  @equipment=Equipment.new  
  end
  
   def edit
     @equipment = Equipment.find(params[:id])
  end
  
   def update
    @equipment = Equipment.find(params[:id])
    if @equipment.update_attributes(equipment_params)
      flash[:success] = "Equipment updated!"
      redirect_to @equipment
    else
      render 'equipment'
    end
  end
  
  def destroy
     Equipment.find(params[:id]).destroy
    flash[:success] = "Equipment deleted."
    redirect_to equipment_url
    
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
                                   :model,:year,:value,:category,:image)
    end
  
  
end
