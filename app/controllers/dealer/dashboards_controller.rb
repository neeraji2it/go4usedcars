class Dealer::DashboardsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @vehicles = Vehicle.visible_user_dealer_cars.all.page(params[:page]).per(15)
  end
end
