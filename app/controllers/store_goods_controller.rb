class StoreGoodsController < ApplicationController
  def index
    store_id = Store.find_by(name: params[:store]).id
    @store_goods = StoreGood.where(store_id: store_id).joins(:product).merge(Product.order(name: :asc))
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

    @store_good = StoreGood.create!(
      store_id: store_id,
      product_id: params[:id],
      location_id: params[:location_id],
      distributor_id: params[:distributor_id],
      max_amount: params[:max_amount],
      measurement: params[:measurement]
    )

    if @store_good.save
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
      measurement: params[:measurement]
    )

    redirect_to "/#{params[:store]}/products"

  end


  def destroy
    
    store_good = StoreGood.find(params[:id])

    store_good.destroy

    redirect_to "/#{params[:store]}/products"
  end


end
