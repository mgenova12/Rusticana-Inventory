# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

20.times do 
  Product.create(
    name:Faker::Food.dish, 
    measurement:['%','EA', 'BIN','SLEEVE'].sample, 
    prepped:[true,false].sample, 
    item_type: ['dry', 'frozen', 'refrigerated'].sample, 
    case_quantity: rand(0..20),
    price: rand(11.2...76.9).round(2), 
    distributor_id: rand(1..12),
    location_id: rand(1..20)
  )
end