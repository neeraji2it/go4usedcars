namespace :cars do
  desc "car creation"
  task :create => :environment do
    1.times do |i|
      @img = File.open("/home/rails/Pictures/car_img/490 _1.jpg")
    Vehicle.create(
      varient_id: 1,
      location: "bangalore",
      body_style: "MUV_VAN",
      exterior_color: "black",
       reg_year: "2004", 
       manufactured_year: "2004",
        milage: "18000", 
        fuel_type: "LPG",
         engine_type: "petrol",
          transmission: "Manual", 
          registration_state: "kar", 
          registration_no: "1050#{i}", 
          sell_price: 1500000, 
          sterio: "Yes", 
       seat_covers: "Fabric",
        car_for: "User", 
        visible_status: "Visible", 
        where_is_car: "Dealer", 
        offer_price: "nil", 
       
       image: @img,
       status: "live",
       manufacturer_id: 1,
       car_model_id: 1
      )

  end
 end
end