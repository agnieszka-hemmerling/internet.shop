class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :tipe
      t.string :tipe2
      t.string :tipe3

      t.timestamps
    end
  end
end
