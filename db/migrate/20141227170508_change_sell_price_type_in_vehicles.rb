class ChangeSellPriceTypeInVehicles < ActiveRecord::Migration
  def change
    change_column :vehicles, :sell_price, :float
  end
end
