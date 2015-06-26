class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :cart, index: true, foreign_key: true, type: :uuid
      t.references :product, index: true, foreign_key: true
      t.integer :quantity
      t.integer :subtotal

      t.timestamps null: false
    end
  end
end
