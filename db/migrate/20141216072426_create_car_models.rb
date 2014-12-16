class CreateCarModels < ActiveRecord::Migration
  def change
    create_table :car_models do |t|
      t.integer :manufacturer_id
      t.string :name

      t.timestamps
    end
  end
end
