class ForumsController < ApplicationController    
before_action :signed_in_user
  def show
    @forum = Forum.find(params[:id])
  end
  
  def new
    @forum = Forum.new
  end
  
  def create
    @forum = Forum.new(permitted_params)
    
    if @forum.save
      flash[:success] = "Forum was successfully created."
      redirect_to forums_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @forum = Forum.find(params[:id])
  end
  
  def update
    @forum = Forum.find(params[:id])
    
    if @forum.update_attributes(permitted_params)
      flash[:success] = "Forum was updated successfully."
      redirect_to forum_url(@forum)
    end
  end
  
  def destroy
    @forum = Forum.find(params[:id])
    
    if @forum.destroy
      flash[:success] = "Category was deleted."
      redirect_to forums_url
    end
  end

  private

    def permitted_params
      params.require(:forum).permit(:title, :description, :state, :position, :category_id)
    end
end