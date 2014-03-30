class InventoriesController < ApplicationController

  before_action :signed_in_user
  def index
    @search = current_user.inventories.search(search_params)
    @search.sorts = 'name' if @search.sorts.empty?
    @inventories = @search.result().page(params[:page])
    @search.build_condition
    @storages=current_user.storages.all
  end

  def new
    @inventory=Inventory.new
  end

  def destroy
    Inventory.find(params[:id]).destroy
    flash[:success] = "Inventory deleted."
    redirect_to inventories_url

  end
  
     def update
    @inventory = Inventory.find(params[:id])
    if @inventory.update_attributes(inventory_params)
      flash[:success] = "Inventory updated."
      redirect_to @inventory
    else
      render 'inventory'
    end
  end
  

  def edit
    @inventory = Inventory.find(params[:id])
  end

  #def show
  #  @inventory = Inventory.find(params[:id])
  #end

  def create
    @inventory = current_user.inventories.build(inventory_params)
    if @inventory.save
      flash[:success] = "Inventory added successfully!"
      redirect_to inventories_url
    else
      render 'new'
    end
  end

  private

  def inventory_params
       
    params.require(:inventory).permit(:cropyear,:bin,:commodity_variety,:harvested_field,:status,:price,:name, :capacity, :commodity, :ticket_no, :notes, :moisture_content)
  end

end
