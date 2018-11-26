class PrepcenterProduct < ApplicationRecord
  belongs_to :product
  has_many :prepped_store_goods
end
