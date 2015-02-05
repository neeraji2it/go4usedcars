class CareersController < ApplicationController
	
  def create
    @career = Career.new(career_params)
    if @career.save
      redirect_to careers_homes_path(:loc => params[:loc])
    else
     # render careers_homes_path(:loc => params[:loc])
      render  "/homes/careers" 
    end
	end

  private
  def career_params
    params.require(:career).permit!
  end
end


