class CreateSellEvaluations < ActiveRecord::Migration
  def change
    create_table :sell_evaluations do |t|
      t.integer :post_requirement_id
      t.string :evaluator
      t.text :remarks
      
      t.timestamps
    end
  end
end
