# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create!(
  email: "admin@gmail.com",
  password: "admin123"
  )

Manufacturer.find_or_create_by(name: 'Maruti')
Manufacturer.find_or_create_by(name: 'Hyundai')
Manufacturer.find_or_create_by(name: 'Honda')
Manufacturer.find_or_create_by(name: 'Tata')
Manufacturer.find_or_create_by(name: 'Chevrolet')
Manufacturer.find_or_create_by(name: 'Ford')
Manufacturer.find_or_create_by(name: 'Toyota')
Manufacturer.find_or_create_by(name: 'Mahindra')
Manufacturer.find_or_create_by(name: 'Skoda')
Manufacturer.find_or_create_by(name: 'Aston Martin')
Manufacturer.find_or_create_by(name: 'Audi')
Manufacturer.find_or_create_by(name: 'Bentley')
Manufacturer.find_or_create_by(name: 'BMW')
Manufacturer.find_or_create_by(name: 'Bugatti')
Manufacturer.find_or_create_by(name: 'Daewoo')
Manufacturer.find_or_create_by(name: 'Ferrari')
Manufacturer.find_or_create_by(name: 'Fiat')
Manufacturer.find_or_create_by(name: 'Force')
Manufacturer.find_or_create_by(name: 'Hindustan Motors')
Manufacturer.find_or_create_by(name: 'ICML')
Manufacturer.find_or_create_by(name: 'Jaguar')
Manufacturer.find_or_create_by(name: 'Lamborghini')
Manufacturer.find_or_create_by(name: 'Land Rover')
Manufacturer.find_or_create_by(name: 'Mahendra Renault')
Manufacturer.find_or_create_by(name: 'Maserati')
Manufacturer.find_or_create_by(name: 'Maybach')
Manufacturer.find_or_create_by(name: 'Mercedes Benz')
Manufacturer.find_or_create_by(name: 'Mini')
Manufacturer.find_or_create_by(name: 'Mitsubishi')
Manufacturer.find_or_create_by(name: 'Nissan')
Manufacturer.find_or_create_by(name: 'Opel')
Manufacturer.find_or_create_by(name: 'Peugeot')
Manufacturer.find_or_create_by(name: 'Polaris')
Manufacturer.find_or_create_by(name: 'Porsche')
Manufacturer.find_or_create_by(name: 'Premier')
Manufacturer.find_or_create_by(name: 'Renault')
Manufacturer.find_or_create_by(name: 'Reva')
Manufacturer.find_or_create_by(name: 'Rolls Royce')
Manufacturer.find_or_create_by(name: 'San Motors')
Manufacturer.find_or_create_by(name: 'Volkswagen')
Manufacturer.find_or_create_by(name: 'Volvo')

SpecificationCategory.find_or_create_by(name: 'Technical Specification')
SpecificationCategory.find_or_create_by(name: 'Features')
SpecificationCategory.find_or_create_by(name: 'Entertainment')
SpecificationCategory.find_or_create_by(name: 'Safety')
SpecificationCategory.find_or_create_by(name: 'Others')

