class Product < ApplicationRecord
  has_many :store_goods
  has_many :prices

end
