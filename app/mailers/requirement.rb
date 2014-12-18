class Requirement < ActionMailer::Base
  default from: "from@example.com"
   def send_requirement(min_budget, max_budget, car_year, car_year1, make, model,body_type1,body_type2,body_type3,
   	body_type4,body_type5,
   	body_type6,body_type7,body_type8,body_type9,fuel_type1,fuel_type2,fuel_type3,fuel_type4,name,email,phone)
    @a=min_budget
    @b=max_budget
    @c=car_year
    @d=car_year1
    @e=make
    @f=model
    @g=body_type1
    @h=body_type2
    @i=body_type3
    @j=body_type4
    @k=body_type5
    @l=body_type6
    @m=body_type7
    @n=body_type8
    @o=body_type9
    @p=fuel_type1
    @q=fuel_type2
    @r=fuel_type3
    @s=fuel_type4
    @t=name
    @u=mail
    @v=phone
    mail(:to =>"smaranreddy123@gmail.com", :subject => "User Requirements")
  end
end