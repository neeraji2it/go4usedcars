class Admin::PurchaseProceduresController < ApplicationController
  before_filter :authenticate_admin!
  skip_before_action :verify_authenticity_token

  def procure_enquiry
   @sell_cars = SellCar.car_enquiries.all.page(params[:page]).per(15)
    @evaluation = CarEvaluation.new
    respond_to do |format|
      format.html # don't forget if you pass html
      format.xlsx {render xlsx: 'procure_enquiry', filename: "Purchase_Enquiry-#{Time.now.strftime("%Y%m%d%H%M%S")}.xls"}
    end
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
      @car.status = "waiting"
      @car.save
      flash[:notice] = 'Evaluation for Procur Enquiry done! Move to Waiting For Evaluation.'
      respond_to do |format|
        format.js
      end
    end
  end
  
  def waiting_to_evaluate
    @sell_cars = SellCar.car_waiting_for_evaluation.all.page(params[:page]).per(15)
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
      @car.status = "evaluated"
      @car.save
      flash[:notice] = 'Waiting evaluation for car is done! Move to Evaluated page.'
      RequirementMailer.evaluation_desc_image(@car, @evaluation).deliver
      respond_to do |format|
        format.js
      end
    end
  end
  
  def evaluated
    @evaluation = CarEvaluation.new
    @sell_cars = SellCar.car_evaluated.all.page(params[:page]).per(15)
  end
  
  def final_deal
    @car = SellCar.find(params[:sell_car_id])
    @evaluation = CarEvaluation.where(:sell_car_id => @car.id).try(:first)
  end
  
  def update_final_deal
    @car = SellCar.find(params[:sell_car_id])
    @evaluation = CarEvaluation.where(:sell_car_id => @car.id).try(:first)
    if @evaluation.update_attributes(car_evaluation_params)
      @car.status = "purchased"
      flash[:notice] = 'Congrats! Evaluation is done and you have purchased the car. Go to Accept in stock and fill correct car details!'
      @car.save
      respond_to do |format|
        format.js
      end
    end
  end
  
  def purchased_car
    @sell_cars = SellCar.car_purchased.all.page(params[:page]).per(15)
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
    @vehicle = Vehicle.new(vehicle_params.merge(:manufacturer_id => params[:manufacturer_id], :car_model_id => params[:varient][:car_model_id], :varient_id => params[:varient][:varient_id]))
    @vehicle.save
    @purchase_car.update_attributes(:status => "#{Status::SellCar::INSTOCK}")
    @vehicle.update_attributes(:status => "#{Status::Vehicle::LIVE}")
    flash[:notice] = "Purchased vechicle is now Live. Add car specications, images and videos if any!."
    respond_to do |format|
      format.js
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
