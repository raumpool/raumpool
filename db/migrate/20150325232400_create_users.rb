class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :encrypted_information  # attr_encrypted
      t.string :encrypted_information_iv
      t.string :encrypted_information_salt

      t.timestamps null: false
    end
  end
end
