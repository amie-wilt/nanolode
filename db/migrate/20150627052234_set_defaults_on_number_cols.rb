class SetDefaultsOnNumberCols < ActiveRecord::Migration
  def change
    change_column_default(:line_items, :quantity, 0)
    change_column_null(:line_items, :quantity, false)
    change_column_default(:line_items, :subtotal, 0)
    change_column_null(:line_items, :subtotal, false)
    change_column_default(:carts, :total, 0)
    change_column_null(:carts, :total, false)
    change_column_default(:products, :price, 0)
    change_column_null(:products, :price, false)
  end
end
