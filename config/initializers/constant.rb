module Status
  module SellCar
    ENQUIRY = "enquiry"
    WAITING = "waiting"
    EVALUATED = "evaluated"
    PURCHASED = "purchase"
    INSTOCK = "in stock"
  end
  
  module Vehicle
    LIVE = "live"
    SOLD = "sold"
    DEALER = "dealer"
  end  
end
YEAR = (1990..2014)
# BODY_TYPES = ["Sedan", "Coupe", "Hatchback", "Minivan/Van", "Convertible", "SUV/MUV", "Truck",
              # "Station Wagon", "MUV"]
BODY_TYPES = ["Sedan", "Hatchback", "Minivan/Van", "Convertible", "SUV/MUV"]
# FUEL_TYPES = ["Petrol", "Diesel", "CNG", "LPG"]
FUEL_TYPES = ["Petrol", "Diesel", "CNG", "LPG", "Hybrid"]
BASE_URL = "http://go4usedcars.herokuapp.com"

# ADMIN = ["crystal.badu@gmail.com", "badu.crystal@gmail.com"]

 ADMIN = ["sunish@prestigeworld.in" ,"chand@prestigeworld.in"]

#DELHI_ADMIN = "badu.crystal@gmail.com"
#BANGALORE_ADMIN = "crystal.badu@gmail.com"

 DELHI_ADMIN = "chand@prestigeworld.in"
 BANGALORE_ADMIN = "sunish@prestigeworld.in"