class AddInStockToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :is_in_stock, :boolean
  end
end
