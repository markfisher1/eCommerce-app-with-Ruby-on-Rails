class ChangeOrdersCostDatatype < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :total, :integer
  end
end
