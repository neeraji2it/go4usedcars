class HomesController < ApplicationController
	def index
		render layout: false
	end

	def home
	   if request.post?
      RequirementMailer.send_requirement(
      	params[:min_budget],params[:max_budget],params[:car_year],params[:car_year1],params[:make],params[:model],
      	params[:body_type1],params[:body_type2],params[:body_type3],params[:body_type4],params[:body_type5],params[:body_type6],
      	params[:body_type7],params[:body_type8],params[:body_type9],
      	params[:fuel_type1],params[:fuel_type2],params[:fuel_type3],params[:fuel_type4],
        params[:name], params[:email], params[:phone]).deliver
	      flash[:notice] = "Your Requirement has been successfuly submited"
      	redirect_to home_homes_path(:loc => params[:loc])
       end
	end

	def about_us
	end

	def buy_car
    if params[:loc] == "gurgaon"
     @cars = Vehicle.gurgaon_cars
    elsif params[:loc] == "bangalore"
     @cars = Vehicle.bangalore_cars
    else
      @cars = ""
    end
    @manufacturers = Manufacturer.all
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
	end
  
  def load_model
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
  end
  
  def search_car
    
  end

	def sell_car
		@sell_car = SellCar.new
	end

	def save_sell_car
		@sell_car = SellCar.new(sell_car_params)
		if @sell_car.save
			redirect_to  sell_car_homes_path(:loc=>params[:loc])
		else
			render sell_car_homes_path(:loc=>params[:loc])
		end
	end

	def auto_finance
	end

	def insurance
	end

	def contact_us
	end

	def faq
	end

	def testimonial
    @testimonial = Testimonial.new
	end

	def careers
		@career = Career.new
	end

	def contact_us
	end

	def associates_partners
		@associate_partner = AssociatePartner.new
	end

	private

	def sell_car_params
		params.require(:sell_car).permit!
	end
end