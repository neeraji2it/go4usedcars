class CarSpecification < ActiveRecord::Base
  belongs_to :specification
  belongs_to :vehicle
end