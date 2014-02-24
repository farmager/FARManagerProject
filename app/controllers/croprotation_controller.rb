class CroprotationController < ApplicationController


 before_action :set_croprotation, only: [:update, :destroy]
  before_filter :clear_flash
  
  def show
  end

  def index
    @croprotations = Croprotation.all
  end

  def create
    @croprotation = Croprotation.new(croprotation_params)
    if @croprotation.save
      flash[:notice] = 'Crop rotation was successfully created.'
      @croprotations = Croprotation.all
    else
      flash[:error] = @croprotation.errors.full_messages.join(', ')
    end
  end

  def update
    @croprotation.assign_attributes(croprotation_params)
    if @croprotation.save
      flash[:notice] = 'Crop rotation was successfully updated.'
    else
      flash[:error] = @croprotation.errors.full_messages.join(', ')
    end
  end

  def destroy
    if @croprotation.destroy
      flash[:notice] = 'Crop rotation deleted successfully'
    else
      flash[:error] = 'Crop rotation could not be deleted'
    end
    @croprotations = Croprotation.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_croprotation
      @croprotation = Croprotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def croprotation_params
      params.require(:croprotation).permit(:land_location, :planned_crop_year1, :year1,:planned_crop_year2, :year2,:planned_crop_year3, :year3)
    end
 

    def clear_flash
      flash.clear
    end


end
