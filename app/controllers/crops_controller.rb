class CropsController < ApplicationController
  before_action :signed_in_user
  # def index
  # end
# 
  # def new
  # end
# 
  # def create
  # end
# 
  # def destroy
  # end
  
  def new
  @crop=Crop.new  
 
  end
  
  
   def index
    @crops = current_user.crops.paginate(page: params[:page])
  end 
  
  
  def destroy
    
  end
  
   
  def show
    @crop = Crop.find(params[:id])
  end
  
    def create
       @crop = current_user.crops.build(crop_params)
    # @equipment = Equipment.new(equipment_params)
    if @crop.save
      flash[:success] = "Crop added successfully!"
      redirect_to @crop
    else
      render 'new'
    end
  end

  private

    def crop_params
      params.require(:crop).permit(:nitrogen,:phosphorous,:sulfur,:potassium,:crop_type,:variety,:herbicides,:fungicides,:actual_seeded,:total_produced,:yield,:grade,:date_seeded)
      
      

  
  
  
  end
  
end
