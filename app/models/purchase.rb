class Purchase < ApplicationRecord
  # has_many :products
  def products
    Product.where(id: product_ids)
  end
end