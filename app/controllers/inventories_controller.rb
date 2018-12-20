class InventoriesController < ApplicationController

  def new 
    store_id = Store.find_by(name: params[:store]).id 
    store_goods = StoreGood.where(store_id: store_id)
    prepped_store_goods = PreppedStoreGood.where(store_id: store_id)

    @locations = Location.where(store_id: store_id)
    @all_store_goods = store_goods + prepped_store_goods

  end

end
