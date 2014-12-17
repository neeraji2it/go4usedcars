class CreateCarSpecifications < ActiveRecord::Migration
  def change
    create_table :car_specifications do |t|
      t.integer :specification_category_id
      t.integer :specification_id
      t.string :name

      t.timestamps
    end
  end
end
