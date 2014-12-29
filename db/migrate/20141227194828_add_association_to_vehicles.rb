class AddAssociationToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :manufacturer_id, :integer
    add_column :vehicles, :car_model_id, :integer
  end
end
