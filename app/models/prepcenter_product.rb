class PrepcenterProduct < ApplicationRecord
  belongs_to :product
  has_many :store_goods


end
