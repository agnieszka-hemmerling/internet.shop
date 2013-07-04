class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :surname
      t.text :adress
      t.integer :phone
      t.string :email
      t.integer :post_code
      t.text :information
      t.string :order_product

      t.timestamps
    end
  end
end
