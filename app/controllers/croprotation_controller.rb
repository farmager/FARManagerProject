class CroprotationController < ApplicationController

  before_filter :clear_flash
  
  def show
  end

  def index
    @croprotations = Croprotation.all
  end

  def create
    
  end

  def update
   
  end

  def destroy
    
  end

  private
   

    
    def croprotation_params
      params.require(:croprotation).permit(:land_location, :planned_crop_year1, :year1,:planned_crop_year2, :year2,:planned_crop_year3, :year3)
    end
 

    def clear_flash
      flash.clear
    end


end
