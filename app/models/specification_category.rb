class SpecificationCategory < ActiveRecord::Base
  has_many :specifications, :dependent => :destroy
end
