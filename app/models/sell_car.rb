class SellCar < ActiveRecord::Base
	belongs_to :varient
  has_one :car_evaluation, :dependent => :destroy
	has_attached_file :image, :styles => { :small => "500x500", :thumb => "100x100>" }, :default_url => "/assets/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :seller_phone, :presence => true, format: { with: /\A\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\Z/,
    message: " Phone numbers must be in xxx-xxx-xxxx format" }
  validates :manufacture_year,:owner_type,:kms_done,:city,:color,:registration_no,:ownership,:car_insurence,:when_to_sell,:insurence_valid_till,:expected_price,:comments,:seller_name,:seller_email,:seller_organization, :presence => true
  validates :kms_done, numericality: {only_float: true}
  def model_varient
    "#{self.try(:varient).try(:name)} #{self.try(:varient).try(:model).try(:name)}"
  end
  scope :car_enquiries, lambda { where(:status => "enquiry") }
  scope :car_waiting_for_evaluation, lambda { where(:status => "waiting") }
  scope :car_evaluated, lambda { where(:status => "evaluated") }
  scope :car_purchased, lambda { where(:status => "purchased") }
end
