class Specification < ActiveRecord::Base
  belongs_to :specification_category
  has_one :car_specification
end