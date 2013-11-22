class FieldsController < ApplicationController
  before_action :signed_in_user

    def create
    @field = current_user.fields.build(field_params)
    if @field.save
      flash[:success] = "Field created successfully!"
      redirect_to root_url
    else
      @listing_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def field_params
      params.require(:field).permit(:content)
    end
    
end