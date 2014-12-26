class Admin::DashboardsController < ApplicationController

  def index
  end
  
  def testimonials
    @testimonials = Testimonial.all
  end
  
  def dealers
    @associate_partners = AssociatePartner.all
  end
end

