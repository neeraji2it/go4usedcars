class CreateVarients < ActiveRecord::Migration
  def change
    create_table :varients do |t|
      t.integer :car_model_id
      t.string :name

      t.timestamps
    end
  end
end
