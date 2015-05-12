class CarEvaluation < ActiveRecord::Base
  belongs_to :sell_car
  has_attached_file :evaluation_image, :styles => {:thumb => "360x270#", :small=>"50x50#" }
  validates_attachment_content_type :evaluation_image, :content_type => ['image/jpeg','image/jpg', 'image/png', 'image/gif','image/bmp']
  validates :evaluator, :remarks, :presence => true
end