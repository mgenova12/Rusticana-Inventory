class Product < ApplicationRecord
  belongs_to :distributor
  has_many :store_goods
end
