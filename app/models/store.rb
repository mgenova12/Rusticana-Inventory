class Store < ApplicationRecord
  has_many :locations
  has_many :store_products
end
