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
  @sell_cars = SellCar.car_evaluated
  end
  
  def purchased_car
    @sell_cars = SellCar.car_purchased
  end
  
  private
  def car_evaluation_params
    params.require(:car_evaluation).permit!
  end
end