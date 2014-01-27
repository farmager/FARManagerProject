class InventoriesController < ApplicationController

before_action :signed_in_user

    # def create
    # @inventory = current_user.inventories.build(inventory_params)
    # if @inventory.save
      # flash[:success] = "Inventory created successfully!"
      # redirect_to :back
    # else
      # @inventory_items = []
      # # render 'static_pages/home'
    # end
  # end
# 
  # def destroy
  # end
#   
  # def new
  # @inventory = Inventory.new
  # render 'inventory'
  # end
#   
  # def index
#     
  # @inventory  = current_user.inventories.build
  # @inventory_items = current_user.listing.paginate(page: params[:page])
# 
# 
#    
  # end
# 
  # private
# 
    # def inventory_params   
#       
       # params.require(:inventory).permit(:name, :capacity, :commodity, :ticket_no, :notes, :moisture_content)
    # end
#     
#     
#     



  
  def index
    
  end  
  
  def new
  @inventory=Inventory.new  
  end
  
  
  def destroy
    
  end
  
   
  def show
    @inventory = Inventory.find(params[:id])
  end
  
    def create
       @inventory = current_user.inventories.build(inventory_params)
    # @equipment = Equipment.new(equipment_params)
    if @inventory.save
      flash[:success] = "Inventory added successfully!"
      redirect_to @inventory
    else
      render 'new'
    end
  end

  private

    def inventory_params
      params.require(:inventory).permit(:name, :capacity, :commodity, :ticket_no, :notes, :moisture_content)
    end
  


end
