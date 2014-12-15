class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.string :resume_title
      t.string :name
      t.string :sex
      t.text :address
      t.string :email
      t.string :phone
      t.string :job_category

      t.timestamps
    end
  end
end
