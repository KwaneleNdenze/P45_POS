class ChangePriceDataType < ActiveRecord::Migration[5.2]
  def change
    change_table :products do |table|
      table.change :price, :decimal
    end
  end
end
