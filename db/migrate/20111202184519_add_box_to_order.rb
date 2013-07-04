class AddBoxToOrder < ActiveRecord::Migration
  def change
		add_column :orders, :pysio1,:boolean, :default => false    
		add_column :orders, :pysio2, :boolean, :default => false   
		add_column :orders, :pysio3,  :boolean, :default => false   
  end
end
