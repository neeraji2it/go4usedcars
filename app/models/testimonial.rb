class Testimonial < ActiveRecord::Base
  validates :name, :email, :presence => true
  has_attached_file :customer_image,
    :styles => {:thumb => "482x342>", :small=>"80x50>" }
  validates_attachment_content_type :customer_image, :content_type => ['image/jpeg','image/jpg', 'image/png', 'image/gif','image/bmp']

  has_attached_file :feedback_image,
    :styles => {:thumb => "236x342>", :small=>"80x50>" }
  validates_attachment_content_type :feedback_image, :content_type => ['image/jpeg','image/jpg', 'image/png', 'image/gif','image/bmp']

  def is_approved?
    self.approve? ? "approved" : "disapproved"
  end

  scope :approved_user_section, -> { where("approve=? and display=?", true, "User_create") }
  scope :approved_admin_section, -> { where("approve=? and display=?", true, "Admin_create") }
end