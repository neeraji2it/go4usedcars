class Career < ActiveRecord::Base
  has_attached_file :resume
  validates_attachment_content_type :resume, :content_type =>["application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain","application/pdf"], :message => ', Only PDF, WORD or TEXT files are allowed. '
end