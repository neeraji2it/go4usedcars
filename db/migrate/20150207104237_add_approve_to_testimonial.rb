class AddApproveToTestimonial < ActiveRecord::Migration
  def change
    add_column :testimonials, :approve, :boolean, :default => false
  end
end
