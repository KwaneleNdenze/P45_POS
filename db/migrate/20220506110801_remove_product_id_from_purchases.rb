class RemoveProductIdFromPurchases < ActiveRecord::Migration[5.2]
  def change
    remove_column :purchases, :product_id, :bigint
  end
end
