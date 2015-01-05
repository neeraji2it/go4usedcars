class AssociatePartner < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
end
