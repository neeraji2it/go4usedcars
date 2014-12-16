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
    @car_model =  CarModel.new(car_model_params)
    if @car_model.save
      redirect_to addtostock_admin_stocks_path
    else
      render :action => :addtostock
    end
  end

  def create_varient
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
  end

  def create_master_specification
    @specification = Specification.new(specification_params)
    if @specification.save
      redirect_to add_master_specification_admin_stocks_path
    else
      return :add_master_specification
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
end