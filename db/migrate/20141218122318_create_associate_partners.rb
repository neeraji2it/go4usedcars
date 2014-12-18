class CreateAssociatePartners < ActiveRecord::Migration
  def change
    create_table :associate_partners do |t|
      t.string :name
      t.string :phone
      t.text :address
      t.string :email
      t.string :dealer_type
      t.string :dealer_name

      t.timestamps
    end
  end
end
