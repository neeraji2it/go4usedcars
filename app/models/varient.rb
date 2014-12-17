class Varient < ActiveRecord::Base
  belongs_to :car_model
  has_many :vehicles, :dependent => :destroy
end