class AddStatusToSellCars < ActiveRecord::Migration
  def change
    add_column :sell_cars, :status, :string, :default => "enquiry"
  end
end
