class PricesController < ApplicationController
  authorize_resource
  def index
    @saved_price_dates = SavedPrice.all
    @products = Product.order(:name)
  end

  def date 
    @saved_prices = SavedPrice.all.reverse_order
  end

  def show 
    @prices = Price.where(saved_price_id: params[:saved_price_id])
    @date = SavedPrice.find(params[:saved_price_id]).created_at
  end

  def new
    @distributors = Distributor.all
    @products = Product.order(:name)

    @p = Product.new
  end

  def create 
    saved_price = SavedPrice.create(
      status: 'saved'
    )

    params[:product].each do |k, v|
      @product = Product.find(k)  
      @product.update(
        price: v['price']
      )

      Price.create(
        amount: v['price'],
        product_id: k,
        saved_price_id: saved_price.id
      )
    end

    redirect_to '/product_prices/prices'
  end 


end
