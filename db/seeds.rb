# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# 20.times do 
#   Product.create(
#     name:Faker::Food.dish, 
#     measurement:['%','EA', 'BIN','SLEEVE'].sample, 
#     prepped:[true,false].sample, 
#     item_type: ['dry', 'frozen', 'refrigerated'].sample, 
#     case_quantity: rand(0..20),
#     price: rand(11.2...76.9).round(2), 
#     distributor_id: rand(1..12)
#   )
# end

# 20.times do 
#   Location.create(name: ['Walkin Self 1', 'Walkin Self 2', 'Walkin Self 3', 'Walkin Self 4', 
#     'Walkin Self 5','Walkin Self 6', 'Shed Location 1', 'Shed Location 2', 'Shed Location 3', 'Shed Location 4',
#      'Shed Location 5', 'Back Table', 'Front Counter', 'Office', 'Walkin Floor', 'Top Walkin', 
#      'Right Freezer', 'Left Freezer', 'Back Table','Back Shelf'].sample
#   )
# end

# 12.times do 
#   Distributor.create(name: ['Coke', 'Holt', 'Sysco', 'PrepCenter', 'US Foods', 'Gordon', 'Jetro', 'Sams', 'Walmart',
#     'Amazon', 'EcoLab', 'Espo'].sample
#   )
# end

# 10.times do 
#   StoreGood.create(store_id:2, product_id:rand(1..20), location_id: rand(1..20), distributor_id: rand(1..12))
# end

# 10.times do 
#   Price.create(amount: rand(11.2...76.9).round(2), product_id: rand(1..20))
# end

# 5.times do 
#   SavedPrice.create(status: 'saved')
# end

Product.all.each do |product|
  product.update(price: rand(11.2...76.9).round(2))
end

