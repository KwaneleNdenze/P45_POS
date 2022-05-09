class Product < ApplicationRecord
  belongs_to :user
  validates :item_name, uniqueness: true
  

end