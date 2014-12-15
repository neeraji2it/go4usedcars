class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :name
      t.string :email
      t.text :testimonial

      t.timestamps
    end
  end
end
