class Admin::CarSpecificationsController < ApplicationController
  before_filter :authenticate_admin!
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
    @technical = SpecificationCategory.where(:name => "Technical Specification").first
    @feature = SpecificationCategory.where(:name => "Features").first
    @entertainment = SpecificationCategory.where(:name => "Entertainment").first
    @safety = SpecificationCategory.where(:name => "Safety").first
    @other = SpecificationCategory.where(:name => "Others").first

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
        technical_names.each_with_index do |name, j|
          @car_spec = CarSpecification.where(
            specification_category_id: @technical.id,
            specification_id: val,
            vehicle_id: vehicle_id
          ).first_or_initialize
          @car_spec.save  
          if(i == j) 
            @car_spec.update_attributes(name: name)
          end
        end
      end
    end

    if feature_ids.present?
      feature_ids.each_with_index do |val, i|
        feature_names.each_with_index do |name, j|
          @car_spec = CarSpecification.where(
            specification_category_id: @feature.id,
            specification_id: val,
            vehicle_id: vehicle_id
          ).first_or_initialize
          @car_spec.save
          if(i==j)
            @car_spec.update_attributes(name: name)
          end
        end
      end
    end

    if entertainment_ids.present?
      entertainment_ids.each_with_index do |val, i|
        entertainment_names.each_with_index do |name, j|
          @car_spec = CarSpecification.where(
            specification_category_id: @entertainment.id,
            specification_id: val,
            vehicle_id: vehicle_id
          ).first_or_initialize
          @car_spec.save
          if(i==j)
            @car_spec.update_attributes(name: name)
          end
        end
      end
    end

    if safety_ids.present?
      safety_ids.each_with_index do |val, i|
        safety_names.each_with_index do |name, j|
          @car_spec = CarSpecification.where(
            specification_category_id: @safety.id,
            specification_id: val,
            vehicle_id: vehicle_id
          ).first_or_initialize
          @car_spec.save
          if(i==j)
            @car_spec.update_attributes(name: name)
          end
        end
      end
    end
    redirect_to edit_admin_car_specification_path(vehicle_id)
  end

  def edit
    load_edit_specification
  end

  def update
    update_specification
    redirect_to edit_admin_car_specification_path(params[:id])
  end  
  
  def edit_car_specification
    @vehicles = Vehicle.all
  end
  
  def edit_car_specific
    load_edit_specification
  end
  
  def update_car_specific
    update_specification
  end
  
  def load_edit_specification
    @vehicle = Vehicle.find(params[:id])
    @vehicles = Vehicle.all

    @technical = SpecificationCategory.where(:name => "Technical Specification").first
    @feature = SpecificationCategory.where(:name => "Features").first
    @entertainment = SpecificationCategory.where(:name => "Entertainment").first
    @safety = SpecificationCategory.where(:name => "Safety").first

    @technical_car_specifications = CarSpecification.where("vehicle_id=? and specification_category_id=?", @vehicle.id, @technical.id)
    @feature_car_specifications = CarSpecification.where("vehicle_id=? and specification_category_id=?", @vehicle.id, @feature.id)
    @entertainment_car_specifications = CarSpecification.where("vehicle_id=? and specification_category_id=?", @vehicle.id, @entertainment.id)
    @safety_car_specifications = CarSpecification.where("vehicle_id=? and specification_category_id=?", @vehicle.id, @safety.id)
  end
  
  def update_specification
    technical_car_ids        = params[:technical_car_ids]
    feature_car_ids          = params[:feature_car_ids]
    entertainment_car_ids    = params[:entertainment_car_ids]
    safety_car_ids           = params[:safety_car_ids]

    if technical_car_ids.present?
      technical_car_ids.each_with_index do |val, i|
        name = "name_#{val}".to_sym
        @car_specification1 = CarSpecification.find(val)

        #@car_specification1.specification_id = val
        @car_specification1.name = params[name]
        @car_specification1.save
      end
    end

    if feature_car_ids.present?
      feature_car_ids.each_with_index do |val, i|
        @car_specification2 = CarSpecification.find(val)
        @car_specification2.name = params["name_#{val}".to_sym]
        @car_specification2.save
      end
    end

    if entertainment_car_ids.present?
      entertainment_car_ids.each_with_index do |val, i|
        @car_specification3 = CarSpecification.find(val)
        @car_specification3.name = params["name_#{val}".to_sym]
        @car_specification3.save
      end
    end

    if safety_car_ids.present?
      safety_car_ids.each_with_index do |val, i|
        @car_specification4 = CarSpecification.find(val)
        @car_specification4.name = params["name_#{val}".to_sym]
        @car_specification4.save
      end
    end
  end

  private
  def car_specification_params
    params.require(:car_specification).permit!
  end
end