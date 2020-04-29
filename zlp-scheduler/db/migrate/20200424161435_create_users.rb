class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, force: true do |t|
        t.integer :uin
        t.string :lastname
        t.string :firstname
        t.string :email
        t.string :password_digest
    
        t.timestamps
    end
  end
end
