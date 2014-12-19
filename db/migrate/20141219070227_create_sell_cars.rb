class CreateSellCars < ActiveRecord::Migration
  def change
    create_table :sell_cars do |t|
      t.integer :varient_id
      t.attachment :image
      t.string :name
      t.datetime :manufacture_year
      t.string :owner_type
      t.float :kms_done
      t.string :city
      t.string :color
      t.string :transmission
      t.string :registration_no
      t.datetime :registration_at
      t.string :ownership
      t.string :car_insurence
      t.string :when_to_sell
      t.datetime :insurence_valid_till
      t.float :expected_price
      t.text :comments
      t.string :seller_name
      t.string :seller_email
      t.string :seller_phone
      t.string :seller_organization
      t.timestamps
    end
  end
end
