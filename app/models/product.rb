class Product < ApplicationRecord
  belongs_to :distributor
  has_many :store_products
end
