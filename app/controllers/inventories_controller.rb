class InventoriesController < ApplicationController
  include InventoriesHelper

  def new 
    @inventory = Inventory.new

    store_id = Store.find_by(name: params[:store]).id 
    store_goods = StoreGood.where(store_id: store_id)
    prepped_store_goods = PreppedStoreGood.where(store_id: store_id)

    @locations = Location.where(store_id: store_id)
    @all_store_goods = store_goods + prepped_store_goods

  end

  def create
    store_id = Store.find_by(name: params[:store]).id

    order = Order.create!(
      status: 'Complete',
      order_day: params[:order_day]
    )

    params[:inventory].each do |inventory|
      if inventory[:product_id]
        Inventory.create!(
          store_id: store_id,
          product_id: inventory[:product_id],
          prepcenter_product_id: nil,
          quantity: inventory[:quantity],
          order_id: order.id,
          message: params[:message],
          quantity_needed: quantity_needed(inventory)
        )
      else 
        Inventory.create!(
          store_id: store_id,
          product_id: nil,
          prepcenter_product_id: inventory[:prepcenter_product_id],
          quantity: inventory[:quantity],
          order_id: order.id,
          message: params[:message],
          quantity_needed: quantity_needed(inventory)
        )
      end
    end


  end


end
