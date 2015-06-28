class CreateCarts < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :carts do |t|
      t.integer :total
      t.uuid :permalink, null: false, default: 'uuid_generate_v4()'

      t.timestamps null: false
    end
  end
end
