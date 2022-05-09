class AddProductIdsToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :product_ids, :string, array: true, default: []
  end
end
