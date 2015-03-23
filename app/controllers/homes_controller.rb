class HomesController < ApplicationController
  #protect_from_forgery with: :null_session
  
	def index
		render layout: false
	end

	def home
    @post_req = PostRequirement.new
  end

  def save_post_req
    @post_req = PostRequirement.new(post_requirement_params)
    if params[:body_types].present?
      @body_types = params[:body_types]
    end
    if params[:body_types].present?
      @fuel_types = params[:fuel_types]
    end
    @post_req.body_type = @body_types.join(",")
    @post_req.fuel_type = @fuel_types.join(",")
    if @post_req.save
      RequirementMailer.send_requirement(@post_req, params[:loc]).deliver
      flash[:notice] = "Your Requirement has been successfuly submited."
      redirect_to home_homes_path(:loc => params[:loc])
    else
      render :action => :home
    end
  end

	def about_us
	end

	def buy_car
    @post_req = PostRequirement.new
    
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
      @cars = @cars.where("milage BETWEEN ? AND ?", "0", mileage)
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
    
    @cars = @cars.page(params[:page]).per(15)

    #  filter by manufacturer
    @manufacturers = Manufacturer.all
    @car_models = CarModel.where("manufacturer_id = ?", params[:manufacturer_id])
	end
  
  def car_description
    @car = Vehicle.find_by_id(params[:id])
    @images = @car.images
  end
  
  def call_me
    RequirementMailer.get_info(params[:id], params[:name], params[:email], params[:phone], params[:description], params[:loc]).deliver      
    redirect_to :back
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
    redirect_to buy_car_homes_path(:loc => params[:loc])
  end
  
  def load_model
    @car_models = CarModel.where("manufacturer_id=?", params[:manufacturer_id])
  end

  def load_varient
    @car_varients = Varient.where("car_model_id=?", params[:car_model_id])
  end
  
	def sell_car
		@sell_car = SellCar.new
	end

	def save_sell_car
		@sell_car = SellCar.new(sell_car_params.merge(:varient_id => params[:varient_id], :car_model_id => params[:car_model_id]))
		if @sell_car.save
      flash[:notice] = "Car details are created successfully."
			redirect_to  sell_car_homes_path(:loc=>params[:loc])
		else
			render :action => 'sell_car'
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
    @approved_users = Testimonial.approved_user_section
    @approved_admins = Testimonial.approved_admin_section
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

  def post_requirement_params
    params.require(:post_requirement).permit!
  end
end