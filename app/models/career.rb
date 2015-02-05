class Career < ActiveRecord::Base
  has_attached_file :resume
  validates :phone, :presence => true, format: { with: /\A\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\Z/,
    message: "number must be in xxx-xxx-xxxx format" }
  validates :resume_title,:name,:address,:email,:sex,:job_category, :presence => true
  validates_attachment_content_type :resume, :content_type =>["application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
    "text/plain","application/pdf"], :message => ', Only PDF, WORD or TEXT files are allowed. '
end
