class StaticPagesController < ApplicationController


  def home
    if signed_in?
      @fields = current_user.fields.build
      @equipment = current_user.equipment.build

      @maintenances=current_user.maintenance.all

      @totalfields=current_user.fields.all

      @posts=Post.limit(10).all
      @fields=current_user.fields.limit(10)

      @total=current_user.fields.where(year:'2013').sum(:seeded_acres)
      @canola_produced=current_user.fields.where("crop_type like ? AND year=2013", "%Canola%").sum(:production)
      @wheat_produced=current_user.fields.where("crop_type like ? AND year=2013", "%Wheat%").sum(:production)
      @peas_produced=current_user.fields.where("crop_type like ? AND year=2013", "%Peas%").sum(:production)

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
