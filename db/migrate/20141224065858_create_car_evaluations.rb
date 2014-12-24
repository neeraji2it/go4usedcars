class CreateCarEvaluations < ActiveRecord::Migration
  def change
    create_table :car_evaluations do |t|
      t.integer :sell_car_id
      t.string :evaluator
      t.text :remarks
      t.float :expected_price
      t.float :evaluated_price
      t.float :deal_price1
      t.float :deal_price2

      t.timestamps
    end
  end
end
