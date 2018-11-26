class Store < ApplicationRecord
  has_many :locations
  has_many :store_goods
  has_many :prepped_store_goods
end
