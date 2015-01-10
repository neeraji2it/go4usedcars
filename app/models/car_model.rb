class CarModel < ActiveRecord::Base
  belongs_to :manufacturer
  has_many :varients, :dependent => :destroy
  has_many :vehicles, :dependent => :destroy
  validates :name, uniqueness: {scope: :manufacturer_id}, :presence => true
end