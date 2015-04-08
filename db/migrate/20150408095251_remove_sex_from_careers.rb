class RemoveSexFromCareers < ActiveRecord::Migration
  def change
    remove_column :careers, :sex, :string
  end
end
