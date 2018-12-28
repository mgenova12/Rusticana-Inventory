class OrdersController < ApplicationController

  def index     
    store_id = Store.find_by(name: params[:store]).id
    @orders = Order.where.not(store_id: store_id).reverse_order
  end

  def new
    @inventory = Inventory.new
    @inventories = Inventory.where(order_id: params[:id])

    @message = Order.find(params[:id]).message   

  end

  def create 
    order = Order.find(params[:order_id])

    order.update!(
      status: 'Complete'
    )

    params[:inventory].each do |inventory|
      if inventory[:inventory_id]
        current_inv = Inventory.find(inventory[:inventory_id])

        current_inv.update!(
          out_of_stock: inventory[:out_of_stock]
        )

      end
    end

    redirect_to "/#{params[:store]}/orders"
  end

end
