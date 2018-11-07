class Product < ApplicationRecord
  belongs_to :location
  belongs_to :distributor
end
