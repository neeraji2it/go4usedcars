class RemoveColumnsFromSellCars < ActiveRecord::Migration
  def change
    remove_column :sell_cars, :name
    remove_column :sell_cars, :registration_at
  end
end
