class AddDetailsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :created_at, :timestamp
    add_column :orders, :updated_at, :timestamp
    add_column :orders, :paid, :integer
    add_column :orders, :status, :integer
  end
end
