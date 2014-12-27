class Admin::VehiclesController < ApplicationController
   skip_before_action :verify_authenticity_token
  def new
    @vehicle = Vehicle.new
    @manufacturers = Manufacturer.all
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
    @varients = Varient.where("car_model_id=?", params[:car_model_id])
  end

  def create
    @vehicle = Vehicle.new(vehicle_params.merge(:varient_id => params[:varient][:varient_id]))
    @vehicle.status = "#{Status::Vehicle::LIVE}"
    if @vehicle.save
      redirect_to new_admin_vehicle_path
    else
      render :action => :new
    end
  end
  
  def edit_vehicle
    @vehicles = Vehicle.all
  end
  
  def edit
    @manufacturers = Manufacturer.all
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
    @varients = Varient.where("car_model_id=?", params[:car_model_id])
    @vehicle = Vehicle.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  def update_vehicle
    @vehicle = Vehicle.find(params[:id])
    p "--------------------------------------"
    p @vehicle
    @vehicle.update_attributes(vehicle_params)
      respond_to do |format|
        format.js
      end
  end

  def load_car_model
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
  end

  def load_varients
    @varients = Varient.where("car_model_id=?", params[:car_model_id])
  end
  
  def destroy
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def vehicle_params
    params.require(:vehicle).permit!
  end
end