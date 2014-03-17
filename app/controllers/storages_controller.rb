class StoragesController < ApplicationController
  
 before_action :signed_in_user
  
  def index
    @storage = current_user.storage.paginate(page: params[:page])
  end  
  
  def new
  @storage=Storage.new  
  end
  
   def edit
     @storage = Storage.find(params[:id])
  end
  
   def update
    @storage = Storage.find(params[:id])
    if @storage.update_attributes(storage_params)
      flash[:success] = "Storage updated!"
      redirect_to inventories_url
    else
      render 'inventory'
    end
  end
  
  def destroy
     Storage.find(params[:id]).destroy
    flash[:success] = "Bin successfully deleted."
    redirect_to inventories_url
    
  end
  
   
  def show
    @storage = Storage.find(params[:id])
  end
  
    def create
       @storage = current_user.storages.build(storage_params)
    
    if @storage.save
      flash[:success] = "Bin added successfully!"
      redirect_to inventories_url
    else
      render 'new'
    end
  end
  
  
 

private
    def storage_params
      params.require(:storage).permit(:name,:capacity,:group,:notes,:rent_or_own)
    end
  
  
end
