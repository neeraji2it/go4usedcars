class Admin::SpecificationsController < ApplicationController
  def new
    @specification = Specification.new
  end

  def create 
    @specification = Specification.new(specification_params)
    if @specification.save
      redirect_to root_path
    else
      render :action => :new
    end
  end

  private
  def specification_params
    params.require(:specification).permit!
  end
end