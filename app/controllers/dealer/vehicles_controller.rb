class Dealer::VehiclesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params.merge(:user_id => current_user.id))
    @vehicle.status = Vehicle::DEALER
    if @vehicle.save
      redirect_to dealer_vehicles_path
    else
      render :action => :new
    end 
  end

  def index
    @vehicles = Vehicle.dealer_cars
  end
end