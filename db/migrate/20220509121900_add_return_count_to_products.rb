class AddReturnCountToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :return_count, :integer
  end
end
