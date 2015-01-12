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
BODY_TYPES = ["Sedan", "Coupe", "Hatchback", "Minivan/Van", "Convertible", "SUV/MUV", "Truck",
              "Station Wagon", "MUV"]
FUEL_TYPES = ["Petrol", "Diesel", "CNG", "LPG"]