class OrdersController < ApplicationController

  def index     
    @orders = Order.all.reverse_order 
  end

end
