class AddStatusToAssociatePartners < ActiveRecord::Migration
  def change
    add_column :associate_partners, :status, :string, :default => "No"
  end
end
