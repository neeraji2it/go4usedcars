class PostRequirement < ActiveRecord::Base
  has_one :sell_evaluation
  validates :min_budget, :max_budget, :min_year, :max_year, :make, :model, :body_type, :fuel_type, :name,
  :email, :phone, :presence => true
end
