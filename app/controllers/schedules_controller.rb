class SchedulesController < ApplicationController
  
  before_action :signed_in_user
  
  
  def index
    
  end  
  
  def new
  @schedule=Schedule.new  
  end
  
  
  def destroy
    
  end
  
   
  def show
    @schedule = Schedule.find(params[:id])
  end
  
    def create
       @schedule = current_user.schedule.build(schedule_params)
    # @equipment = Equipment.new(equipment_params)
    if @schedule.save
      flash[:success] = "Schedule added successfully!"
      redirect_to @schedule
    else
      render 'new'
    end
  end

  private

    def schedule_params
      params.require(:schedule).permit(:year,:description)
    end
  
  
  
end
