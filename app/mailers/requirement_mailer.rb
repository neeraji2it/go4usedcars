class RequirementMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_requirement(post_req, loc)
    @post_req = PostRequirement.find(post_req.id)
    @min_budget = @post_req.min_budget
    @max_budget = @post_req.max_budget
    @min_year = @post_req.min_year
    @max_year = @post_req.max_year
    @make = @post_req.make
    @model = @post_req.model
    @body_type = @post_req.body_type.split(",").join(", ")
    @fuel_type = @post_req.fuel_type.split(",").join(", ")
    @name = @post_req.name
    @mail = @post_req.email
    @phone = @post_req.phone
    if loc == 'bangalore'
      mail(:to => BANGALORE_ADMIN, :subject => "User Requirements")
    elsif loc == 'gurgaon'
      #mail(:to => DELHI_ADMIN, :subject => "User Requirements")
      mail(:to => ADMIN, :subject => "Get Detailed Car Info") 
    end
  end
  
  def get_info(car, name, email, phone, description, loc)
    @car = Vehicle.find(car)
    @name = name
    @email = email
    @phone = phone
    @description = description
    if loc == 'bangalore'
      mail(:to => BANGALORE_ADMIN, :subject => "User Requirements")
    elsif loc == 'gurgaon'
      mail(:to => ADMIN, :subject => "Get Detailed Car Info") 
    end
  end
  
  def sent_user(user)
    @user = user
    mail(:to =>user.email, :subject => "Login Credentials")
  end
  
  def send_car_details(car, email)
    @car = car
    mail(:to => email, :subject => "Car Details")
  end

  def associate_partner(associate_partner, loc)
    @associate = AssociatePartner.find(associate_partner.id)

    if loc == 'bangalore'
      mail(:to => BANGALORE_ADMIN, :subject => "User Requirements")
    elsif loc == 'gurgaon'
      mail(:to => ADMIN, :subject => "Get Detailed Car Info") 
    end
  end
  
  def evaluation_desc_image(sell_car, eval)
    @car = SellCar.find(sell_car.id)
    @eval = @car.car_evaluation
    if @car.city == 'bangalore'
      mail(:to => BANGALORE_ADMIN, :subject => "Car Evaluation Important Information")
    elsif @car.city == 'gurgaon'
      mail(:to =>  DELHI_ADMIN, :subject => "Car Evaluation Important Information")
    end
  end
end