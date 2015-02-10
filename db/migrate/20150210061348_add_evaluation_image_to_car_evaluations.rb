class AddEvaluationImageToCarEvaluations < ActiveRecord::Migration
  def change
    add_attachment :car_evaluations, :evaluation_image
  end
end
