class InventoriesController < ApplicationController
  authorize_resource
  include InventoriesHelper

  def index 
    store_id = Store.find_by(name: params[:store]).id 
    
    @orders = Order.where(store_id: store_id).reverse_order.page(params[:page]).per(15)
  end

  def new 
    @inventory = Inventory.new

    store_id = Store.find_by(name: params[:store]).id

    @store = Store.find(store_id)

    @store_goods = StoreGood.where(store_id: store_id)

    @locations = Location.where(store_id: store_id).order(:row_num)

  end

  def create
    store_id = Store.find_by(name: params[:store]).id

    order = Order.create!(
      status: 'Pending',
      order_day: params[:order_day],
      message: params[:message],
      store_id: store_id
    )

    params[:inventory].each do |inventory|
      Inventory.create!(
        store_id: store_id,
        quantity: inventory[:quantity],
        order_id: order.id,
        quantity_needed: quantity_needed(inventory),
        store_good_id: inventory[:store_good_id]
      )
    end

    redirect_to "/#{params[:store]}/inventory/all/#{order.id}"

  end

  def show 
    # store_id = Store.find_by(name: params[:store]).id
    # @locations = Location.where(store_id: store_id)

    @item_types = Product.distinct.pluck(:item_type)

    @inventories = Inventory.where(order_id: params[:order_id])

    @distributors = Distributor.all

    @message = Order.find(params[:order_id]).message

  end


end
