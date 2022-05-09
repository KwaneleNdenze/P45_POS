class AddSaleCountToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sale_count, :integer
  end
end
