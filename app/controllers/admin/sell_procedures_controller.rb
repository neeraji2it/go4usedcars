class Admin::SellProceduresController < ApplicationController
  before_filter :authenticate_admin!
  def enquiry
    @enquiries = PostRequirement.all.page(params[:page]).per(15)
  end
  
  def destroy
    @requirement = PostRequirement.find(params[:id])
    @requirement.destroy
    redirect_to enquiry_admin_sell_procedures_path
  end
end