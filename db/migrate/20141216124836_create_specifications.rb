class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.integer :specification_category_id
      t.string :name

      t.timestamps
    end
  end
end
