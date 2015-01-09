class RequirementMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_requirement(
        min_budget, max_budget, car_year, car_year1, make, 
        model,body_type1,body_type2,body_type3,
       	body_type4,body_type5,
       	body_type6,body_type7,body_type8,body_type9,
        fuel_type1,fuel_type2,fuel_type3,fuel_type4,name,email,phone
        )
        @min_budget = min_budget
        @max_budget = max_budget
        @car_year = car_year
        @car_year1 = car_year1
        @make = make
        @model = model
        @body_type1 = body_type1
        @body_type2 = body_type2
        @body_type3 = body_type3
        @body_type4 = body_type4
        @body_type5 = body_type5
        @body_type6 = body_type6
        @body_type7 = body_type7
        @body_type8 = body_type8
        @body_type9 = body_type9
        @fuel_type1=fuel_type1
        @fuel_type2=fuel_type2
        @fuel_type3=fuel_type3
        @fuel_type4=fuel_type4
        @name=name
        @mail=mail
        @phone=phone
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