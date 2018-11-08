class StoreGoodsController < ApplicationController
  def index
    store_id = Store.find_by(name: params[:store]).id
    @store_goods = StoreGood.where(store_id: store_id)

  end

  def add 
    @products = Product.order(:name)
  end

  def new 
    @product = Product.find(params[:id])
    
    store_id = Store.find_by(name: params[:store]).id
    
    @locations = Location.where(store_id: store_id)

  end

  def create

  end

end
