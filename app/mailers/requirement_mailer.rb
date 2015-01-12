class RequirementMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_requirement(post_req)
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
        mail(:to =>"crystal.badu@gmail.com", :subject => "User Requirements")
  end
  
  def sent_user(user)
    @user = user
    mail(:to =>user.email, :subject => "Login Credentials")
  end
  
  def send_car_details(car, email)
    @car = car
    mail(:to => email, :subject => "Car Details")
  end

  def associate_partner(associate_partner)
    @associate = AssociatePartner.find(associate_partner.id)
    mail(:to =>"crystal.badu@gmail.com", :subject => "User Requirements")
  end
end