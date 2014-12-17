class AddVehicleIdToCarSpecification < ActiveRecord::Migration
  def change
    add_column :car_specifications, :vehicle_id, :integer
  end
end
