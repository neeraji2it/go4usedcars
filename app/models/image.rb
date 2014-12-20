class Image < ActiveRecord::Base
  belongs_to :vehicle

  has_attached_file :image,
    :styles => {:thumb => "360x270#", :small=>"50x50#" }
  
  
  validates_attachment_content_type :image, :content_type => ['image/jpeg','image/jpg', 'image/png', 'image/gif','image/bmp']
  
end