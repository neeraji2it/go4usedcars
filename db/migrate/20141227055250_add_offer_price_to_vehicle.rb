class AddOfferPriceToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :offer_price, :float
  end
end
