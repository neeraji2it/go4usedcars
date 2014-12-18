class Specification < ActiveRecord::Base
  belongs_to :specification_category
  has_many :car_specifications
end