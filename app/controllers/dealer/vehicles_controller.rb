class Dealer::VehiclesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @vehicle = Vehicle.new
    @manufacturers = Manufacturer.all
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
    @varients = Varient.where("car_model_id=?", params[:car_model_id])
  end

  def create
    @manufacturers = Manufacturer.all
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
    @varients = Varient.where("car_model_id=?", params[:car_model_id])
    @vehicle = Vehicle.new(vehicle_params.merge(:varient_id => params[:varient][:varient_id], :car_model_id => params[:varient][:car_model_id], :manufacturer_id => params[:manufacturer_id], :user_id => current_user.id, :visible_status => "Visible", :car_for => "Dealer"))
    @vehicle.status = "#{Status::Vehicle::DEALER}"
    if @vehicle.save
      redirect_to dealer_vehicles_path
    else
      render :action => :new
    end 
  end

  def index
    @vehicles = current_user.vehicles.all.page(params[:page]).per(15)
  end
  
  private
  def vehicle_params
    params.require(:vehicle).permit!
  end
end