class Inventory < ApplicationRecord

  belongs_to :product, optional: true
  belongs_to :prepcenter_product, optional: true
end
