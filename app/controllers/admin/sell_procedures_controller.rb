class Admin::SellProceduresController < ApplicationController
  before_filter :authenticate_admin!
  def enquiry
    @enquiries = PostRequirement.all.page(params[:page]).per(15)
    @evaluation = SellEvaluation.new
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
  
  def new_evaluation
    @car = PostRequirement.find(params[:requirement_id])
    @evaluation = SellEvaluation.new
    respond_to do |format|
      format.js
    end
  end
  
  def create_evaluation
    requirement_id = params["sell_evaluation"]["post_requirement_id"]
    @car = PostRequirement.find(requirement_id)
    @evaluation = SellEvaluation.new(sell_evaluation_params)
    if @evaluation.save
      @car.update_attributes(approved: true)
      respond_to do |format|
        format.js
      end
    end
  end
  
  private
  def sell_evaluation_params
   params.require(:sell_evaluation).permit!
  end
end