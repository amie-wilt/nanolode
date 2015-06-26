class CreateCarts < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :carts, :id => :uuid do |t|
      t.integer :total

      t.timestamps null: false
    end
  end
end
