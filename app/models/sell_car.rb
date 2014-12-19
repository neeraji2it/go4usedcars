class SellCar < ActiveRecord::Base
	belongs_to :varient
	has_attached_file :image, :styles => { :small => "500x500", :thumb => "100x100>" }, :default_url => "/assets/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
