class AssociatePartner < ActiveRecord::Base
  validates :email, :presence => true
end
