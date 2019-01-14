class SalesController < ApplicationController
  before_action :authenticate_user!
  
  def index 

    @sales = Order.where(status: 'Complete').reverse_order.page(params[:page]).per(15)
  end

  def show
    @inventories = Inventory.where(order_id: params[:id], out_of_stock: false).where.not(quantity_needed: 0).joins({:store_good => :distributor }).where("distributors.name = 'TRAPPE'")
  end

end
