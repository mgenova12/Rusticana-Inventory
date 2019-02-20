class OrdersController < ApplicationController
  authorize_resource
  def index     
    store_id = Store.find_by(name: params[:store]).id

    @orders = Order.where.not(store_id: store_id).reverse_order.page(params[:page]).per(15)
  end

  def new
    @inventory = Inventory.new
    @store_name = params[:store].upcase
    @inventories = Inventory.where(order_id: params[:id]).where.not(quantity_needed: 0).joins({:store_good => :distributor }).where("distributors.name = '#{@store_name}'")
    @message = Order.find(params[:id]).message   
    @date = Order.find(params[:id]).created_at
  end

  def create 
    order = Order.find(params[:order_id])

    order.update(
      status: 'Complete'
    )

    params[:inventory].each do |inventory|
      if inventory[:inventory_id]
        current_inv = Inventory.find(inventory[:inventory_id])

        if !inventory[:quantity_needed].empty?
          current_inv.update(
            out_of_stock: inventory[:out_of_stock],
            quantity_needed: inventory[:quantity_needed]
          )
        else
          current_inv.update(
            out_of_stock: inventory[:out_of_stock]
          )
        end
      end
    end

    redirect_to "/#{params[:store]}/orders"
  end

  def show 
    store_id = Order.find(params[:id]).store_id
    @current_store = Store.find(store_id).name
    @date = Order.find(params[:id]).created_at
    store_name = params[:store].upcase

    @inventories = Inventory.where(order_id: params[:id]).where.not(quantity_needed: 0).joins({:store_good => :distributor }).where("distributors.name = '#{store_name}'")

    @message = Order.find(params[:id]).message
  end

end
