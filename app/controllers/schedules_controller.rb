class SchedulesController < ApplicationController
  
  before_action :signed_in_user
  
  
  # def index
#     
  # end  
#   
  # def new
  # @schedule=Schedule.new  
  # end
#   
#   
  # def destroy
#     
  # end
#   
#    
  # def show
    # @schedule = Schedule.find(params[:id])
  # end
#   
    # def create
       # @schedule = current_user.schedule.build(schedule_params)
    # # @equipment = Equipment.new(equipment_params)
    # if @schedule.save
      # flash[:success] = "Schedule added successfully!"
      # redirect_to @schedule
    # else
      # render 'new'
    # end
  # end
# 
  # private
# 
    # def schedule_params
      # params.require(:schedule).permit(:year,:description)
    # end
#   


 before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @schedules = Schedule.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @schedule = Schedule.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    
    @schedule=current_user.schedule.build(expense_params)
    
    # @schedule=current_user.Schedule.build(schedule_params)
     # @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @schedule }
      else
        format.html { render action: 'new' }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.had time field 
    def schedule_params
      params.require(:schedule).permit(:description, :start, :end)
    end


  
  
end
