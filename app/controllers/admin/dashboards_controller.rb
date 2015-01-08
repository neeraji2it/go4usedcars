class Admin::DashboardsController < ApplicationController
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
#        if @associate_partner.status == "No"
#          @associate_partner.update_attributes(:status => "Yes")
#        else
#          @associate_partner.update_attributes(:status => "No")
#        end
    if @associate_partner.status == "Yes"
      @associate_partner.update_attributes(:status => "No")
    end
  end
end