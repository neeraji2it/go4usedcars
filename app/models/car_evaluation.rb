class CarEvaluation < ActiveRecord::Base
  belongs_to :sell_car
  has_attached_file :evaluation_image, :styles => {:thumb => "360x270#", :small=>"50x50#" }
  validates_attachment_content_type :evaluation_image, :content_type => ['image/jpeg','image/jpg', 'image/png', 'image/gif','image/bmp']
  validates :evaluator, :remarks, :presence => {:if => "valid_amount?"}
  validates :expected_price, :evaluation_image, :evaluated_price, :deal_price1, :presence => {:if => "deal_amount?"}
  validates :deal_price2, :presence => {:if => "deal_amount2?"}
  attr_accessor :amount_field_validate

  def valid_amount?
    !self.amount_field_validate.nil? and ['valid_amount'].include?(self.amount_field_validate)
  end

  def deal_amount?
    !self.amount_field_validate.nil? and ['deal_amount'].include?(self.amount_field_validate)
  end

  def deal_amount2?
    !self.amount_field_validate.nil? and ['deal_amount2'].include?(self.amount_field_validate)
  end
end