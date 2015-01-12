class Vehicle < ActiveRecord::Base
  has_attached_file :image,
    :styles => {:thumb => "360x270#", :small=>"50x50#" },
     :default_url => "missing.jpg"
  
  validates_attachment_content_type :image, :content_type => ['image/jpeg','image/jpg', 'image/png', 'image/gif','image/bmp']  
  belongs_to :manufacturer
  belongs_to :car_model
  belongs_to :varient
  has_many :car_specification, :dependent => :destroy
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, reject_if: :all_blank, :allow_destroy => true
  has_many :videos, :dependent => :destroy
  belongs_to :user

  def carinfo
    "#{self.try(:varient).try(:car_model).try(:manufacturer).try(:name)}  #{self.try(:varient).try(:car_model).try(:name)}  #{self.try(:varient).try(:name)} (#{self.try(:registration_no)})"
  end
  
  scope :live_cars, lambda { where(:status => "#{Status::Vehicle::LIVE}") }
  scope :sold_cars, lambda { where(:status => "#{Status::Vehicle::SOLD}") }
  scope :gurgaon_cars, lambda { where(:location => "gurgaon") }
  scope :bangalore_cars, lambda { where(:location => "bangalore") }  
  validates :manufacturer_id, :car_model_id, :varient_id, :registration_no,
            :location, :reg_year, :milage, :sell_price, presence: true
  validates :registration_no, uniqueness: true
  scope :dealer_cars, lambda { where(:status => "#{Status::Vehicle::DEALER}")}
end