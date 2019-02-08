class AddAddressFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :street_name, :string
    add_column :users, :zipcode, :string
    add_column :users, :house_number, :string
    add_column :users, :country, :string
  end
end
