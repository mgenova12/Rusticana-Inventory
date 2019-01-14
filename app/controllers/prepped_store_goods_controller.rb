class PreppedStoreGoodsController < ApplicationController

  def new 
    @prepped_product = PrepcenterProduct.find(params[:id])
    store_id = Store.find_by(name: params[:store]).id
    @locations = Location.where(store_id: store_id)
    @distributors = Distributor.all
  end

  def create
    store_id = Store.find_by(name: params[:store]).id

    prepped_store_good = StoreGood.new(
      store_id: store_id,
      prepcenter_product_id: params[:id],
      location_id: params[:location_id],
      max_amount: params[:max_amount],
      distributor_id: params[:distributor_id],
      measurement: params[:measurement]
    )

    if prepped_store_good.save
      redirect_to "/#{params[:store]}/products"
    end
  end

  def edit 
    store_id = Store.find_by(name: params[:store]).id    
    @prepped_store_good = StoreGood.find(params[:id])
    @locations = Location.where(store_id: store_id)
    @distributors = Distributor.all
  end

  def update
    @prepped_store_good = StoreGood.find(params[:id])

    @prepped_store_good.update(
      max_amount: params[:max_amount],
      location_id: params[:location_id],
      distributor_id: params[:distributor_id],
      measurement: params[:measurement]
    )

    redirect_to "/#{params[:store]}/products"
  end


  def destroy
    prepped_store_good = StoreGood.find(params[:id])

    prepped_store_good.destroy

    redirect_to "/#{params[:store]}/products"
  end


end
