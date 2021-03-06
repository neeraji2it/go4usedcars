class AssociatePartnersController < ApplicationController
  def create
		@associate_partner = AssociatePartner.new(associate_params)
		if @associate_partner.save
			 flash[:notice] = "Your request to be associate partner is submitted successfully."
		   RequirementMailer.associate_partner(@associate_partner, params[:loc]).deliver
			 redirect_to associates_partners_homes_path(:loc => params[:loc])
		else
			#render :action => :associates_partners
      render "/homes/associates_partners"
		end
	end

	private
	def associate_params
		params.require(:associate_partner).permit!
	end
end
