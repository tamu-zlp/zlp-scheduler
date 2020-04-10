class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uin, :integer
    add_column :users, :lastname, :string
    add_column :users, :firstname, :string
  end
end
