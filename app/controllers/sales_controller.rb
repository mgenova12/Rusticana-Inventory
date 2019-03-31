class SalesController < ApplicationController
  authorize_resource :class => false
  include SalesHelper

  def index 
    @sales = Order.where(status: 'Complete').reverse_order

    @stores = Store.where(label: 'Store')
  end

  def show
    if Order.find(params[:id]).order_day == 'Quick Order'
      @inventories = Inventory.where(order_id: params[:id], out_of_stock: false).where.not(quantity_needed: 0).joins({:store_good => :distributor })
    else
      @inventories = Inventory.where(order_id: params[:id], out_of_stock: false).where.not(quantity_needed: 0).joins({:store_good => :distributor }).where("distributors.name = 'TRAPPE'")
    end    

    @sale_total = Order.find(params[:id]).sale_total
    @store_name = Order.find(params[:id]).store.name
    @date = Order.find(params[:id]).created_at    

  end


  def new 
    if Order.find(params[:id]).order_day == 'Quick Order'
      @inventories = Inventory.where(order_id: params[:id], out_of_stock: false).where.not(quantity_needed: 0).joins({:store_good => :distributor })
    else
      @inventories = Inventory.where(order_id: params[:id], out_of_stock: false).where.not(quantity_needed: 0).joins({:store_good => :distributor }).where("distributors.name = 'TRAPPE'")
    end 
    
    @store_name = Order.find(params[:id]).store.name
    @date = Order.find(params[:id]).created_at    
  end

  def create 
    order = Order.find(params[:order_id])
    order.update(
      paid: true,
      sale_total: params[:sale_total]
    )

    redirect_to '/financials/sales'
  end

end
