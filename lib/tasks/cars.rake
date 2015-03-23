namespace :cars do
  desc "Delete the cart after 24 hrs purchased_at is null"
  task :create => :environment do
    1.times do |i|
      @img = File.open("/home/rails/Pictures/car_img/490 _1.jpg")
    Vehicle.create(
      varient_id: 1,
      location: "bangalore",
      body_style: "Hatchback",
      exterior_color: "black",
       reg_year: "2014", 
       manufactured_year: "2014",
        milage: "6567", 
        fuel_type: "LPG",
         engine_type: "petrol",
          transmission: "Manual", 
          registration_state: "kar", 
          registration_no: "450#{i}", 
          sell_price: 589854.0, 
          sterio: "Yes", 
       seat_covers: "Fabric",
        car_for: "User", 
        visible_status: "Visible", 
        where_is_car: "Dealer", 
        offer_price: "flat offer of 20%", 
       
       image: @img,
        status: "live",
       manufacturer_id: 1,
       car_model_id: 1
      )
  
  end
 end
end