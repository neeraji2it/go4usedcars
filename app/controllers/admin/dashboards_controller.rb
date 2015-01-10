class Admin::DashboardsController < ApplicationController
  before_filter :authenticate_admin!
  def index
  end
  
  def testimonials
    @testimonials = Testimonial.all
  end
  
  def dealers
    @associate_partners = AssociatePartner.all
    @user = User.new
  end
  
  def approved
    @associate_partner = AssociatePartner.find(params[:id])
    @user = User.where("email = '#{@associate_partner.email}'").first
    @associate_partner.status == "Yes" ? @associate_partner.update_attributes(:status => "No") : @associate_partner.update_attributes(:status => "Yes")
    @user.approved == true ? (@user.update_attribute(:approved, false)) : (@user.update_attribute(:approved, true))
  end
end