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
     vehicle_id           = params[:car_specification][:vehicle_id]
     technical_ids        = params[:technical_ids]
     technical_names      = params[:technical_name]
     feature_ids          = params[:feature_ids]
     feature_names        = params[:feature_name]
     entertainment_ids    = params[:entertainment_ids]
     entertainment_names  = params[:entertainment_name]
     safety_ids           = params[:safety_ids]
     safety_names         = params[:safety_name]

     if technical_ids.present?
      technical_ids.each_with_index do |val, i|
        @car_specification1 = CarSpecification.new
        @car_specification1.specification_id = val
        @car_specification1.name = technical_names[i]
        @car_specification1.vehicle_id = vehicle_id
        @car_specification1.save
      end
     end

     if feature_ids.present?
      feature_ids.each_with_index do |val, i|
        @car_specification2 = CarSpecification.new
        @car_specification2.specification_id = val
        @car_specification2.name = feature_names[i]
        @car_specification2.vehicle_id = vehicle_id
        @car_specification2.save
      end
     end

     if entertainment_ids.present?
      entertainment_ids.each_with_index do |val, i|
        @car_specification3 = CarSpecification.new
        @car_specification3.specification_id = val
        @car_specification3.name = entertainment_names[i]
        @car_specification3.vehicle_id = vehicle_id
        @car_specification3.save
      end
     end

     if safety_ids.present?
      safety_ids.each_with_index do |val, i|
        @car_specification = CarSpecification.new
        @car_specification.specification_id = val
        @car_specification.name = safety_names[i]
        @car_specification.vehicle_id = vehicle_id
        @car_specification.save
      end
     end

     redirect_to new_admin_car_specification_path
  end

  private
  def car_specification_params
    params.require(:car_specification).permit!
  end
end