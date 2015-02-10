class Admin::SellProceduresController < ApplicationController
  before_filter :authenticate_admin!
  def enquiry
    @enquiries = PostRequirement.all.page(params[:page]).per(15)
    respond_to do |format|
      format.html # don't forget if you pass html
      format.xlsx {render xlsx: 'enquiry',filename: "Sell_Enquiry-#{Time.now.strftime("%Y%m%d%H%M%S")}.xls"}
    end
  end
  
  def destroy
    @requirement = PostRequirement.find(params[:id])
    @requirement.destroy
    redirect_to enquiry_admin_sell_procedures_path
  end
end