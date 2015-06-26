class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :permalink
      t.integer :price
      t.string :image
      t.string :sku

      t.timestamps null: false
    end
  end
end
