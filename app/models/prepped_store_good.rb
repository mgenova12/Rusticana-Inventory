class PreppedStoreGood < ApplicationRecord
  belongs_to :store
  belongs_to :prepcenter_product
  belongs_to :location  
end
