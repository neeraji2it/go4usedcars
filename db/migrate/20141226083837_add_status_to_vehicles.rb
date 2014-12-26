class AddStatusToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :status, :string
  end
end
