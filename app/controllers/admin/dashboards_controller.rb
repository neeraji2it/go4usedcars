class Admin::DashboardsController < ApplicationController
  before_filter :authenticate_admin!
  def index
  end
  
  def testimonials
    @testimonials = Testimonial.all.page(params[:page]).per(15)
  end
  
  def dealers
    @associate_partners = AssociatePartner.all.page(params[:page]).per(15)
    @user = User.new
  end
  
  def approved
    @associate_partner = AssociatePartner.find(params[:id])
    @user = User.where("email = '#{@associate_partner.email}'").first
    @associate_partner.status == "Yes" ? @associate_partner.update_attributes(:status => "No") : @associate_partner.update_attributes(:status => "Yes")
    @user.approved == true ? (@user.update_attribute(:approved, false)) : (@user.update_attribute(:approved, true))
  end
  
  def dealer_cars
    @vehicles = Vehicle.dealer_cars.all.page(params[:page]).per(15)
  end
  
  def move_to_stock
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update_attributes!(:status => "#{Status::Vehicle::LIVE}")
      flash[:notice] = "You have successfully added this vehicle to your stock."
      redirect_to dealer_cars_admin_dashboards_path
    end
  end
end