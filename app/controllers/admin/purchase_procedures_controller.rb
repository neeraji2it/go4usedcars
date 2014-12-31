class Admin::PurchaseProceduresController < ApplicationController
  def procure_enquiry
    @sell_cars = SellCar.car_enquiries
    @evaluation = CarEvaluation.new
  end 
  
  def new_evaluation
    @car = SellCar.find(params[:sell_car_id])
    @evaluation = CarEvaluation.new
    respond_to do |format|
      format.js
    end
  end
  
  def create_evaluation
    sell_car_id = params["car_evaluation"]["sell_car_id"]
    @car = SellCar.find(sell_car_id)
    @evaluation = CarEvaluation.new(car_evaluation_params)
    if @evaluation.save
      @car.update_attributes(status: "waiting")
      respond_to do |format|
        format.js
      end
    end
  end
  
  def waiting_to_evaluate
    @sell_cars = SellCar.car_waiting_for_evaluation
    @evaluation = CarEvaluation.new
  end
  
  def deal
    @car = SellCar.find(params[:sell_car_id])
    @evaluation = CarEvaluation.where(:sell_car_id => @car.id).try(:first)
  end
  
  def update_deal
    @car = SellCar.find(params[:sell_car_id])
    @evaluation = CarEvaluation.where(:sell_car_id => @car.id).try(:first)
    if @evaluation.update_attributes(car_evaluation_params)
      @car.update_attributes(status: "evaluated")
      respond_to do |format|
        format.js
      end
    end
  end
  
  def evaluated
    @evaluation = CarEvaluation.new
    @sell_cars = SellCar.car_evaluated
  end
  
  def final_deal
    @car = SellCar.find(params[:sell_car_id])
    @evaluation = CarEvaluation.where(:sell_car_id => @car.id).try(:first)
  end
  
  def update_final_deal
    @car = SellCar.find(params[:sell_car_id])
    @evaluation = CarEvaluation.where(:sell_car_id => @car.id).try(:first)
    if @evaluation.update_attributes(car_evaluation_params)
      @car.update_attributes(status: "purchased")
      respond_to do |format|
        format.js
      end
    end
  end
  
  def purchased_car
    @sell_cars = SellCar.car_purchased
  end
  
  #add_to_stock
  def publish_vehicle
    @purchase_car = SellCar.find(params[:sell_car_id])
    @vehicle = Vehicle.new
    @manufacturers = Manufacturer.all
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
    @varients = Varient.where("car_model_id=?", params[:car_model_id])
  end
  
  def save_vehicle
    @purchase_car = SellCar.find(params[:sell_car_id])
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      @purchase_car.update_attributes(:status => "#{Status::SellCar::INSTOCK}")
      @vehicle.update_attributes(:status => "#{Status::Vehicle::LIVE}")
      redirect_to specification_entry_admin_purchase_procedures_path
    else
      render :action => :publish_vehicle
    end
  end
  
  def specification_entry
    @car_specification = CarSpecification.new
    @vehicles = Vehicle.all

    @technicals = SpecificationCategory.where(:name => "Technical Specification").first.specifications
    @features = SpecificationCategory.where(:name => "Features").first.specifications
    @entertainments = SpecificationCategory.where(:name => "Entertainment").first.specifications
    @safeties = SpecificationCategory.where(:name => "Safety").first.specifications
    @others = SpecificationCategory.where(:name => "Others").first.specifications
  end
    
  private
  def car_evaluation_params
    params.require(:car_evaluation).permit!
  end
  
  def vehicle_params
    params.require(:vehicle).permit!
  end
  
  def car_specification_params
    params.require(:car_specification).permit!
  end
end