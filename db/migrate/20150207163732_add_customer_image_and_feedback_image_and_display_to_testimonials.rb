class AddCustomerImageAndFeedbackImageAndDisplayToTestimonials < ActiveRecord::Migration
  def change
    add_attachment :testimonials, :customer_image
    add_attachment :testimonials, :feedback_image
    add_column :testimonials, :display, :string #admin_create, user_create
  end
end
