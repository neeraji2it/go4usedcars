class Vehicle < ActiveRecord::Base
  has_attached_file :image,
    :styles => {:thumb => "360x270#", :small=>"50x50#" }
  
  validates_attachment_content_type :image, :content_type => ['image/jpeg','image/jpg', 'image/png', 'image/gif','image/bmp']
  belongs_to :varient
  has_many :car_specification
  has_many :images
  accepts_nested_attributes_for :images, reject_if: :all_blank, :allow_destroy => true
  has_many :videos

  def carinfo
    self.varient.car_model.manufacturer.name + " " + self.varient.car_model.name + " " + self.varient.name
  end
end