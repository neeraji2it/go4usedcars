class CreateSpecificationCategories < ActiveRecord::Migration
  def change
    create_table :specification_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
