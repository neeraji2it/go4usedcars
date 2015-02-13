class AddApprovedToPostRequirements < ActiveRecord::Migration
  def change
    add_column :post_requirements, :approved, :boolean, :default => false
  end
end
