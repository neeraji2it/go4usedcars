class ChangeTypeInSellCar < ActiveRecord::Migration
  def change
    change_column :sell_cars, :registration_at, :string
  end
end