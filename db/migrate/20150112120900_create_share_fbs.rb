class CreateShareFbs < ActiveRecord::Migration
  def change
    create_table :share_fbs do |t|
      t.string :provider
      t.string :uid
      t.string :secret_token
      t.string :email
      t.string :secret
      t.timestamps
    end
  end
end
