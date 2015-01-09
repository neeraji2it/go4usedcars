class HomesController < ApplicationController
  #protect_from_forgery with: :null_session
  
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
    amount = split_price(params[:price])
    if amount.present?
      min = amount[0]
      max = amount[1]
    end
    mileage              = params[:mileage]
    registration_year    = params[:registration_year]
    car_model_id         = params[:car_model_id]
    manufacturer_id      = params[:manufacturer]
    body_style           = params[:bds]
    search               = params[:search]
    # bangalore cars  
    @cars = Vehicle.bangalore_cars if params[:loc] == "bangalore"
    #    gurgaon cars
    @cars = Vehicle.gurgaon_cars if params[:loc] == "gurgaon"
    
    #main search implementation
    if search.present?
      @cars = Vehicle.search "#{params[:search]}"
    end
    
    #    filter by min & max prices
    if min.present? && max.blank?
      @cars = @cars.where("sell_price >= ?", min)
    elsif min.present? && max.present?
      @cars = @cars.where("sell_price BETWEEN ? AND ?", min, max)
    end
    
    #    filter by registration year
    if registration_year.present?
      @cars = @cars.where("reg_year = ?", registration_year)
    end
    
    #    filter by mileage
    if mileage.present?
      @cars = @cars.where("milage BETWEEN ? AND ?", 0, mileage)
    end
    
    #  filter by car model
    if car_model_id.present?
      @cars = @cars.where(car_model_id: car_model_id)
    end
       
    # filter by manufacturer model
    if manufacturer_id.present?
      @cars = @cars.where(manufacturer_id: manufacturer_id)
    end
    
    #filter by body_type
    if body_style.present?
      @cars = @cars.where(body_style: body_style)
    end
    
    #  filter by manufacturer
    @manufacturers = Manufacturer.all
    @car_models = CarModel.where("manufacturer_id = ?", params[:manufacturer_id])
	end
  
  def split_price(price)
    if price.present?
      min = price.split("-")[0].to_f
      max = price.split("-")[1].to_f
      return min, max
    end
  end
  
  def print
    @car = Vehicle.find_by_id(params[:id])
  end
  
  def send_details
    @car = Vehicle.find_by_id(params[:car_id])
    RequirementMailer.send_car_details(@car, params[:email]).deliver if params[:email].present?
    redirect_to root_path
  end
  
  def load_model
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
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