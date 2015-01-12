class CreatePostRequirements < ActiveRecord::Migration
  def change
    create_table :post_requirements do |t|
      t.string :min_budget
      t.string :max_budget
      t.string :min_year
      t.string :max_year
      t.string :make
      t.string :model
      t.string :body_type
      t.string :fuel_type
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end