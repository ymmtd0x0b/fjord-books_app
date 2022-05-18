class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :postal_code, :string
    add_column :users, :self_introduction, :text
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
    add_column :users, :street, :string
    add_column :users, :building, :string
  end
end
