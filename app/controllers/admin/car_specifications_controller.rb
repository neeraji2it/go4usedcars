class Admin::CarSpecificationsController < ApplicationController
  def new
    @car_specification = CarSpecification.new
    @vehicles = Vehicle.all

    @technicals = SpecificationCategory.where(:name => "Technical Specification").first.specifications
    @features = SpecificationCategory.where(:name => "Features").first.specifications
    @entertainments = SpecificationCategory.where(:name => "Entertainment").first.specifications
    @safeties = SpecificationCategory.where(:name => "Safety").first.specifications
    @others = SpecificationCategory.where(:name => "Others").first.specifications
  end

  def create 
    @car_specification = CarSpecification.new(car_specification_params)
    if @car_specification.save
      redirect_to root_path
    else
      render :action => :new
    end
  end

  private
  def car_specification_params
    params.require(:car_specification).permit!
  end
end