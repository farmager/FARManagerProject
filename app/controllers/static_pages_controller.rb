class StaticPagesController < ApplicationController
 
  
   def home
    if signed_in?
      @field  = current_user.fields.build
      @listing_items = current_user.listing.paginate(page: params[:page])
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
