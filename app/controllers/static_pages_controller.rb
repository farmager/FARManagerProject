class StaticPagesController < ApplicationController
 
  
   def home
    if signed_in?
      @field  = current_user.fields.build
      @equipment = current_user.equipment.build
      @listing_items = current_user.listing.paginate(page: params[:page])
      @inventory  = current_user.fields.build
      @inventory_items = current_user.listing.paginate(page: params[:page])    
    
    end
  end

  def faq
  end

  def about
  end

  def features
  end

  def contactus
  end
end
