class InventoriesController < ApplicationController
  include InventoriesHelper

  def index 
    store_id = Store.find_by(name: params[:store]).id 
    
    @orders = Order.where(store_id: store_id).reverse_order 
  end

  def new 
    @inventory = Inventory.new

    store_id = Store.find_by(name: params[:store]).id 
    @store_goods = StoreGood.where(store_id: store_id)

    @locations = Location.where(store_id: store_id)

  end

  def create
    store_id = Store.find_by(name: params[:store]).id

    order = Order.create!(
      status: 'Complete',
      order_day: params[:order_day],
      message: params[:message],
      store_id: store_id
    )

    params[:inventory].each do |inventory|
      if inventory[:product_id]
        Inventory.create!(
          store_id: store_id,
          quantity: inventory[:quantity],
          order_id: order.id,
          quantity_needed: quantity_needed(inventory),
          store_good_id: inventory[:store_good_id]
        )
      else 
        Inventory.create!(
          store_id: store_id,
          quantity: inventory[:quantity],
          order_id: order.id,
          quantity_needed: quantity_needed(inventory),
          store_good_id: inventory[:store_good_id]
        )
      end
    end

    redirect_to "/#{params[:store]}/inventory/all/#{order.id}"

  end

  def show 
    store_id = Store.find_by(name: params[:store]).id
    @locations = Location.where(store_id: store_id)
    @inventories = Inventory.where(store_id: store_id, order_id: params[:order_id])
    @distributors = Distributor.all
    @message = Order.find(params[:order_id]).message

  end


end
