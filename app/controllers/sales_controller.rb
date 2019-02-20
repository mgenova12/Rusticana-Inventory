class SalesController < ApplicationController
  authorize_resource :class => false
  include SalesHelper

  def index 
    @sales = Order.where(status: 'Complete').reverse_order.page(params[:page]).per(15)
  end

  def show
    @inventories = Inventory.where(order_id: params[:id], out_of_stock: false).where.not(quantity_needed: 0).joins({:store_good => :distributor }).where("distributors.name = 'TRAPPE'")
    @sale_total = Order.find(params[:id]).sale_total
    @store_name = Order.find(params[:id]).store.name
    @date = Order.find(params[:id]).created_at    

  end


  def new 
    @inventories = Inventory.where(order_id: params[:id], out_of_stock: false).where.not(quantity_needed: 0).joins({:store_good => :distributor }).where("distributors.name = 'TRAPPE'")
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
