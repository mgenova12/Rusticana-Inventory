class StoreGood < ApplicationRecord
  has_many :inventories
  belongs_to :store
  belongs_to :product, optional: true
  belongs_to :distributor, optional: true
  belongs_to :location
  belongs_to :prepcenter_product, optional: true
end
