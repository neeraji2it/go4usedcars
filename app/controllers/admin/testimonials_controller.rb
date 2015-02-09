class Admin::TestimonialsController < ApplicationController
  before_filter :authenticate_admin!

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)
    if @testimonial.save
      flash[:notice] = "Testimonial is saved successfully."
      redirect_to testimonials_admin_dashboards_path
    else
      render :action => :new
    end
  end

  private
  def testimonial_params
    params.require(:testimonial).permit!
  end
end