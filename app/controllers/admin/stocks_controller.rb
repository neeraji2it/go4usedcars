class Admin::StocksController < ApplicationController
  before_filter :authenticate_admin!

  def addtostock
    @car_model =  CarModel.new
    @car_varient = Varient.new
    @manufacturers = Manufacturer.all
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
  end

  def car_model
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
  end

  def create_model
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
    @car_varient = Varient.new
    @car_model =  CarModel.new(car_model_params)
     @manufacturers = Manufacturer.all
    if @car_model.save
      redirect_to addtostock_admin_stocks_path
    else
      render :action => :addtostock
    end
  end

  def create_varient
    @car_model =  CarModel.new
    @manufacturers = Manufacturer.all
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
    @car_varient = Varient.new(car_varient_params)
    if @car_varient.save
      redirect_to addtostock_admin_stocks_path
    else
      render :action => :addtostock
    end
  end

  def add_master_specification
    @specification = Specification.new

    @technicals = SpecificationCategory.where(:name => "Technical Specification").first.specifications
    @features = SpecificationCategory.where(:name => "Features").first.specifications
    @entertainments = SpecificationCategory.where(:name => "Entertainment").first.specifications
    @safeties = SpecificationCategory.where(:name => "Safety").first.specifications
    @others = SpecificationCategory.where(:name => "Others").first.specifications
  end

  def create_master_specification
    @technicals = SpecificationCategory.where(:name => "Technical Specification").first.specifications
    @features = SpecificationCategory.where(:name => "Features").first.specifications
    @entertainments = SpecificationCategory.where(:name => "Entertainment").first.specifications
    @safeties = SpecificationCategory.where(:name => "Safety").first.specifications
    @others = SpecificationCategory.where(:name => "Others").first.specifications
    
    @specification = Specification.new(specification_params)
    if @specification.save
      redirect_to add_master_specification_admin_stocks_path
    else
      render :add_master_specification
    end
  end

  def delete_procure_enquiry
    @sell_car = SellCar.find(params[:id])
    if @sell_car.destroy
      redirect_to procure_enquiry_admin_stocks_path
    end
  end

  def display_car_varient

  end
  
  def edit_stock
    @manufacturers = Manufacturer.all
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
    @car_varients = Varient.where("car_model_id=?", params[:model_id])
  end
  
  def update_model
    @carmodel = CarModel.find(params[:model_id])     
    model_name = params[:model_name]
    @carmodel.update_attributes(:name => model_name)
    respond_to do |format|
      format.js
    end
  end
  
  def list_varient
    @manufacturers = Manufacturer.all
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
    @car_varients = Varient.where("car_model_id=?", params[:model_id])
  end

  def update_varient
    varient_name = params[:varient_name]     
    @varient = Varient.find(params[:varient_id])
    @varient.update_attributes(:name => varient_name)
    respond_to do |format|
      format.js
    end
  end
  
  def live_cars
    @cars = Vehicle.live_cars.all.page(params[:page]).per(15)
  end
  
  def sold_cars
    @cars = Vehicle.sold_cars.all.page(params[:page]).per(15)
  end
  
  def sold
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update_attributes(:status => "#{Status::Vehicle::SOLD}")
      respond_to do |format|
        format.js
      end
    end
  end
  
  def unsold
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update_attributes(:status => "#{Status::Vehicle::LIVE}")
      respond_to do |format|
        format.js
      end
    end
  end

  def offer
    @vehicles = Vehicle.all
    @cars = Vehicle.where("offer_price IS NOT NULL")
    @vehicle = Vehicle.new
  end
  
  def edit_offer
    @vehicle = Vehicle.find(params[:vehicle_id])
    @vehicles = Vehicle.all
    @cars = Vehicle.where("offer_price IS NOT NULL")
  end
 
  def update_offer
    @cars = Vehicle.where("offer_price IS NOT NULL")
    @vehicles = Vehicle.all
    @vehicle = Vehicle.find(params[:vehicle_id])
    if @vehicle.update(vehicle_offer_params)
      respond_to do |format|
        format.js
      end
    end
  end
  
  def offer_index
   @vehicles = Vehicle.all
   @cars = Vehicle.where("offer_price IS NOT NULL")
  end
  
  def remove_offer
    @vehicle = Vehicle.find(params[:id])
    @cars = Vehicle.where("offer_price IS NOT NULL")
    if @vehicle.update_attributes(:offer_price => nil)
      respond_to do |format|
        format.js
      end
    end
  end
   
  private
  def car_model_params
    params.require(:car_model).permit!
  end

  def car_varient_params
    params.require(:varient).permit!
  end

  def specification_params
    params.require(:specification).permit!
  end
  
  def vehicle_offer_params
    params.require(:vehicle).permit!
  end
  
end