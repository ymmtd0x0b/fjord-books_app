class AddAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
    add_column :users, :street, :string
    add_column :users, :building, :string
  end
end
