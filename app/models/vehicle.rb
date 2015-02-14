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

  #gurgaon cars and bangalore cars which are for User && visible to User
  scope :gurgaon_cars, -> { where("location=? and visible_status=? and (car_for=? or car_for=? )", 'gurgaon', 'Visible', 'Both', 'User') }
  scope :bangalore_cars, -> { where("location=? and visible_status=? and (car_for=? or car_for=? )", 'bangalore', 'Visible', 'Both', 'User') }
  
  #these are the vehicle created by admin for user || dealer and whose status=visible
  scope :visible_user_dealer_cars, lambda { where("visible_status=? and (car_for=? or car_for=?) ", 'Visible', 'Both', 'Dealer') }
  
  validates :image, :body_style, :exterior_color, :fuel_type, :manufactured_year, :manufacturer_id, :car_model_id, :varient_id, :registration_no,
    :location, :reg_year, :milage, :sell_price, :visible_status, :engine_type, :car_for,
    :transmission, :registration_state, :seat_covers, :sterio, presence: true
  
  validates_numericality_of :reg_year,:manufactured_year,:milage, :only_integer => true, 
    :message => "can only be number."

  validates :sell_price , numericality: {only_float: true}

  validates :registration_no, uniqueness: true
  
  #these are the status which is created by dealer
  scope :dealer_cars, lambda { where(:status => "#{Status::Vehicle::DEALER}")}
  
  def post(post)
    me = FbGraph::User.me(ShareFb.first.secret_token)
    me.feed!(
      :message => "Car Enquiry",
      :name => post.carinfo,
      :link => BASE_URL,
      :description => "Color: #{post.exterior_color} Location: #{post.location} Body Style: #{post.body_style} Mileage: #{post.milage} Fuel Type: #{post.fuel_type} Reg Yr: #{post.reg_year} Price: #{post.sell_price}"
    )
  end
end