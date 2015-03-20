class AddManufacturerIdAndCarModelIdInSellCar < ActiveRecord::Migration
  def change
    add_column :sell_cars, :manufacturer_id, :integer
    add_column :sell_cars, :car_model_id, :integer
  end
end
