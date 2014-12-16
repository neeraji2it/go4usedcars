class Admin::StocksController < ApplicationController
   before_filter :authenticate_admin!

  def addtostock
    @car_model =  CarModel.new
    @car_varient = Varient.new
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
    @car_varient = Varient.new
    if @car_varient.save
      redirect_to addtostock_admin_stocks_path
    else
      render :action => :addtostock
    end
  end

  private
  def car_model_params
    params.require(:car_model).permit!
  end

  def car_varient_params
    params.require(:varient).permit!
  end
end