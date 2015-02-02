class AssociatePartner < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
  
  def self.user_partner(email)
    where(:email => email).first
  end
end
