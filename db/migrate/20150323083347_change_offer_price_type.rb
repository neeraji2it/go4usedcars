class ChangeOfferPriceType < ActiveRecord::Migration
  def change
    change_column :vehicles, :offer_price, :string
  end
end
