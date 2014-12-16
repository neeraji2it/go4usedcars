class Manufacturer < ActiveRecord::Base
  has_many :car_models, :dependent => :destroy
end
