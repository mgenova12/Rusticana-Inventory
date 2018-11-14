class Price < ApplicationRecord
  belongs_to :product
  belongs_to :saved_price
end
