class Admin::DashboardsController < ApplicationController

  def index
  end
  
  def testimonials
    @testimonials = Testimonial.all
  end
  
  def dealers
    @associate_partners = AssociatePartner.all
  end
  
  def approved
    @associate_partner = AssociatePartner.find(params[:id])
    if @associate_partner.status == "No"
      @associate_partner.update_attributes(:status => "Yes")
    else
      @associate_partner.update_attributes(:status => "No")
    end
  end
end