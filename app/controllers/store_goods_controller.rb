class StoreGoodsController < ApplicationController
  authorize_resource
  def index
    store_id = Store.find_by(name: params[:store]).id
    @store_goods = StoreGood.where(store_id: store_id).joins(:product).merge(Product.order(name: :asc))
    @prepped_store_goods = StoreGood.where(store_id: store_id).joins(:prepcenter_product).merge(PrepcenterProduct.order(name: :asc))
  end

  def add 
    @store_id = Store.find_by(name: params[:store]).id

    @products = Product.order(:name)
    @prepped_products = PrepcenterProduct.order(:name)
  end

  def new 
    @product = Product.find(params[:id])
    store_id = Store.find_by(name: params[:store]).id
    @locations = Location.where(store_id: store_id)
    @distributors = Distributor.all
  end

  def create
    store_id = Store.find_by(name: params[:store]).id

    store_good = StoreGood.new(
      store_id: store_id,
      product_id: params[:id],
      location_id: params[:location_id],
      distributor_id: params[:distributor_id],
      max_amount: params[:max_amount],
      measurement: params[:measurement],
      replenish_by_each: params[:replenish_by_each]
    )

    if store_good.save
      redirect_to "/#{params[:store]}/products"
    end
  end

  def edit 
    store_id = Store.find_by(name: params[:store]).id    
    @store_good = StoreGood.find(params[:id])
    @locations = Location.where(store_id: store_id)
    @distributors = Distributor.all    
  end

  def update
    @store_good = StoreGood.find(params[:id])

    @store_good.update(
      max_amount: params[:max_amount],
      location_id: params[:location_id],
      distributor_id: params[:distributor_id],
      measurement: params[:measurement],
      replenish_by_each: params[:replenish_by_each]
    )

    redirect_to "/#{params[:store]}/products"

  end


  def destroy
    
    store_good = StoreGood.find(params[:id])
    store_good.destroy

    inventory = Inventory.find_by(store_good_id: params[:id])
    inventory.destroy

    redirect_to "/#{params[:store]}/products"
  end


end
