class CreateAdminstudrecs < ActiveRecord::Migration[5.0]
  def change
    create_table :adminstudrecs do |t|
      t.string :name
      t.integer :uin
      t.string :email
      t.string :classcode
      t.string :major

      t.timestamps
    end
  end
end
