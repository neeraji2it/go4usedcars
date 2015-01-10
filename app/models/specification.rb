class Specification < ActiveRecord::Base
  belongs_to :specification_category
  has_one :car_specification
  validates :specification_category_id, :presence => true 
  validates :name, :presence => true 
end