class CarModel < ActiveRecord::Base
  belongs_to :manufacturer
  has_many :varients, :dependent => :destroy
end