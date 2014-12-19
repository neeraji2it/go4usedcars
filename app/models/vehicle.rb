class Vehicle < ActiveRecord::Base
  has_attached_file :image,
    :styles => {:thumb => "360x270#", :small=>"50x50#" }
  
  validates_attachment_content_type :image, :content_type => ['image/jpeg','image/jpg', 'image/png', 'image/gif','image/bmp']
  belongs_to :varient
  has_one :car_specification

  def carinfo
    self.varient.car_model.manufacturer.name + " " + self.varient.car_model.name + " " + self.varient.name
  end
end