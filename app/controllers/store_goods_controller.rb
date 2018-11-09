class StoreGoodsController < ApplicationController
  def index
    store_id = Store.find_by(name: params[:store]).id
    @store_goods = StoreGood.where(store_id: store_id).order(created_at: :desc)

  end

  def add 
    @products = Product.order(:name)
    @store_id = Store.find_by(name: params[:store]).id
  end

  def new 
    @product = Product.find(params[:id])
    store_id = Store.find_by(name: params[:store]).id
    @locations = Location.where(store_id: store_id)
    @distributors = Distributor.all
  end

  def create
    store_id = Store.find_by(name: params[:store]).id

    @store_good = StoreGood.new(
      store_id: store_id,
      product_id: params[:id],
      location_id: params[:location_id],
      distributor_id: params[:distributor_id],
      max_amount: params[:max_amount]
    )

    if @store_good.save
      redirect_to "/#{params[:store]}/products"
    end

  end

end
