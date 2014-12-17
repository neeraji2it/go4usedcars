class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.integer :varient_id
      t.text :location
      t.string :body_style
      t.string :exterior_color
      t.string :reg_year
      t.string :manufactured_year
      t.string :milage
      t.string :fuel_type
      t.string :engine_type
      t.string :transmission
      t.string :registration_state
      t.string :registration_no
      t.string :sell_price
      t.string :sterio
      t.string :seat_covers
      t.string :car_for
      t.string :visible_status
      t.string :where_is_car

      t.timestamps
    end
  end
end
