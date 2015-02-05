class AssociatePartner < ActiveRecord::Base
  validates :email,:dealer_name,:name,:address,:dealer_type, :presence => true, :uniqueness => true
    validates :phone, :presence => true, format: { with: /\A\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\Z/,
    message: "Number must be in xxx-xxx-xxxx format" }
  def self.user_partner(email)
    where(:email => email).first
  end
end
