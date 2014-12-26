class Admin::DashboardsController < ApplicationController

  def index
  end
  
  def testimonials
    @testimonials = Testimonial.all
  end
end
