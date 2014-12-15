class TestimonialsController < ApplicationController
  def create
    @testimonial = Testimonial.new(testimonial_params)
    if @testimonial.save
      redirect_to testimonial_homes_path(:loc => params[:loc])
    else
      redirect_to testimonial_homes_path(:loc => params[:loc])
    end
  end

  def index
  end
  
  private
  def testimonial_params
    params.require(:testimonial).permit!
  end
end