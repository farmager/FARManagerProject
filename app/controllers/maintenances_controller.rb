class MaintenancesController < ApplicationController
  
      before_action :signed_in_user
  
  def index
    @maintenance = current_user.maintenance.paginate(page: params[:page])
  end  
  
  def new
  @maintenance=Maintenance.new  
  end
  
   def edit
     @maintenance = Maintenance.find(params[:id])
  end
  
   def update
    @maintenance = Maintenance.find(params[:id])
    if @maintenance.update_attributes(maintenance_params)
      flash[:success] = "Maintenance updated!"
      redirect_to equipment_index_path
    else
      render 'equipment'
    end
  end
  
  def destroy
     Maintenance.find(params[:id]).destroy
    flash[:success] = "Maintenance record successfully deleted."
    redirect_to equipment_index_path
    
  end
  
   
  def show
    @maintenance = Maintenance.find(params[:id])
  end
  
    def create
       @maintenance = current_user.maintenance.build(maintenance_params)
    
    if @maintenance.save
      flash[:success] = "Maintenance record added successfully!"
      redirect_to equipment_index_path
    else
      render 'new'
    end
  end
  
  
  

private
    def maintenance_params
      params.require(:maintenance).permit(:maintenance_date,:next_maintenance_date,:maintenance_notes,:mainteance_data,:equipment_maintained,
                                   :maintenance_cost,:created_at)
    end
  
  
  
end
