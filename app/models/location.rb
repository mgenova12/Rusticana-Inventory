class Location < ApplicationRecord
  belongs_to :store
  has_many :store_goods
  has_many :prepped_store_goods
end
