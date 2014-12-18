class Admin::VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
    @manufacturers = Manufacturer.all
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
    @varients = Varient.where("car_model_id=?", params[:car_model_id])
  end

  def create
    @vehicle = Vehicle.new(vehicle_params.merge(:varient_id => params[:varient][:varient_id]))
    if @vehicle.save
      redirect_to new_admin_vehicle_path
    else
      render :action => :new
    end
  end

  def load_car_model
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
  end

  def load_varients
    @varients = Varient.where("car_model_id=?", params[:car_model_id])
  end

  private
  def vehicle_params
    params.require(:vehicle).permit!
  end
end