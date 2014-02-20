class ObservationsController < ApplicationController
before_action :signed_in_user
  def index
    @search = current_user.observations.search(search_params)
    @search.sorts = 'year' if @search.sorts.empty?
    @observations = @search.result().page(params[:page])
    @search.build_condition
  end

  def new
    @observation=Observation.new
  end

  def destroy
    Observation.find(params[:id]).destroy
    flash[:success] = "Field observation deleted."
    redirect_to observations_url

  end
  
     def update
    @observation = Observation.find(params[:id])
    if @observation.update_attributes(observation_params)
      flash[:success] = "Field observation updated."
      redirect_to @observation
    else
      render 'observation'
    end
  end
  

  def edit
    @observation = Observation.find(params[:id])
  end

  def show
    @observation = Observation.find(params[:id])
  end

  def create
    @observation = current_user.observations.build(observation_params)
    
    if @observation.save
      flash[:success] = "Field observation added successfully!"
      redirect_to @observation
    else
      render 'new'
    end
  end

  private

  def observation_params
  
       
    params.require(:observation).permit(:observation_type,:year,:landparcel,:cropobserved,:severity,:growthstage,:notes,:image)
  end
end
