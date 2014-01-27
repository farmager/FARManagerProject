class FieldsController < ApplicationController
  before_action :signed_in_user

    # def create
    # @field = current_user.fields.build(field_params)
    # if @field.save
      # flash[:success] = "Field created successfully!"
       # redirect_to :back
    # else
      # @listing_items = []
      # # render 'static_pages/home'
    # end
  # end
# 
  # def destroy
  # end
#   
  # def index
#     
  # @field  = current_user.fields.build
  # @listing_items = current_user.listing.paginate(page: params[:page])
# 
# 
#    
  # end
# 
  # private
# 
    # def field_params   
       # params.require(:field).permit(:content)
    # end
#   


def index
    
  end  
  
  def new
  @field=Field.new  
  end
  
  
  def destroy
    
  end
  
   
  def show
    @field = Field.find(params[:id])
  end
  
    def create
       @field = current_user.fields.build(equipment_params)
    # @equipment = Equipment.new(equipment_params)
    if @field.save
      flash[:success] = "Equipment added successfully!"
      redirect_to @field
    else
      render 'new'
    end
  end

  private

    def equipment_params
      params.require(:field).permit(:content)
    end
  
end