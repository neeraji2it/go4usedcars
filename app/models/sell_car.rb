class SellCar < ActiveRecord::Base
	belongs_to :varient
  has_one :car_evaluation, :dependent => :destroy
	has_attached_file :image, :styles => { :small => "500x500", :thumb => "100x100>" }, :default_url => "/assets/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  def model_varient
    "#{self.try(:varient).try(:name)} #{self.try(:varient).try(:model).try(:name)}"
  end
  scope :car_enquiries, lambda { where(:status => "enquiry") }
  scope :car_waiting_for_evaluation, lambda { where(:status => "waiting") }
  scope :car_evaluated, lambda { where(:status => "evaluated") }
  scope :car_purchased, lambda { where(:status => "purchased") }
end