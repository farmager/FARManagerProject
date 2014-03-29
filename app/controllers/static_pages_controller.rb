class StaticPagesController < ApplicationController


  def home
    if signed_in?
      @fields = current_user.fields.build
      @equipment = current_user.equipment.build

      @maintenances=current_user.maintenance.all


      @posts=Post.limit(10).all
      @fields=current_user.fields.limit(10)

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
