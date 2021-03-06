class PrepcenterProductsController < ApplicationController
  authorize_resource
  def index
    @prepcenter_products = PrepcenterProduct.order(:name)
  end

  def new 
    @product = Product.find(params[:id])
  end

  def create 

    @product = PrepcenterProduct.new(
      name: params[:name],
      measurement: params[:measurement], 
      item_type: params[:item_type], 
      portion_size: params[:portion_size], 
      product_id: params[:id],
      case_quantity: params[:case_quantity]
    )

    if @product.save
      redirect_to '/globals/products/prepcenter'
    end

  end

  def edit 
    @prepcenter_product = PrepcenterProduct.find(params[:id])
  end

  def update 
    @prepcenter_product = PrepcenterProduct.find(params[:id])

    @prepcenter_product.update(
      name: params[:name],
      measurement: params[:measurement], 
      item_type: params[:item_type], 
      portion_size: params[:portion_size],
      case_quantity: params[:case_quantity]
    )

    redirect_to '/globals/products/prepcenter'
  end

  def destroy
    prepcenter_product = PrepcenterProduct.find(params[:id])
    prepped_store_good = StoreGood.find_by(prepcenter_product_id: params[:id])

    if prepped_store_good
      prepped_store_good.destroy
    end

    prepcenter_product.destroy

    redirect_to '/globals/products/prepcenter'
  end


end
