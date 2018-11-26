class PreppedStoreGoodsController < ApplicationController

  def index
    @prepped_store_goods = Store.find_by(name: params[:store]).prepped_store_goods.order(created_at: :desc)
  end

  def add 
    @prepped_products = PrepcenterProduct.order(:name)
    @store_id = Store.find_by(name: params[:store]).id
  end

  def new 
    @prepped_product = PrepcenterProduct.find(params[:id])
    store_id = Store.find_by(name: params[:store]).id
    @locations = Location.where(store_id: store_id)
  end

  def create
    store_id = Store.find_by(name: params[:store]).id

    @prepped_store_good = PreppedStoreGood.create!(
      store_id: store_id,
      prepcenter_product_id: params[:id],
      location_id: params[:location_id],
      max_amount: params[:max_amount]
    )

    if @prepped_store_good.save
      redirect_to "/#{params[:store]}/products/prepcenter"
    end
  end

  def edit 
    store_id = Store.find_by(name: params[:store]).id    
    @prepped_store_good = PreppedStoreGood.find(params[:id])
    @locations = Location.where(store_id: store_id)
  end

  def update
    @prepped_store_good = PreppedStoreGood.find(params[:id])

    @prepped_store_good.update(
      max_amount: params[:max_amount],
      location_id: params[:location_id]
    )

    redirect_to "/#{params[:store]}/products/prepcenter"
  end


  def destroy
    prepped_store_good = PreppedStoreGood.find(params[:id])

    prepped_store_good.destroy

    redirect_to "/#{params[:store]}/products/prepcenter"
  end


end
