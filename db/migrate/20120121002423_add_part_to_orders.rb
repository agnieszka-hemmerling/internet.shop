class AddPartToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :post, :string
    add_column :orders, :phone1, :string
  end
end
