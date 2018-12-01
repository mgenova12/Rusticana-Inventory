class PrepcenterProductsController < ApplicationController
  def index
    @prepcenter_products = PrepcenterProduct.all
  end


  def new 
    @product = Product.find(params[:id])
  end

  def create 

    @product = PrepcenterProduct.new(
      name: params[:name],
      measurement: params[:measurement], 
      prepped: params[:prepped], 
      item_type: params[:item_type], 
      portion_size: params[:portion_size], 
      product_id: params[:id]
    )

    if @product.save
      redirect_to '/products/prepcenter'
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
      prepped: params[:prepped], 
      item_type: params[:item_type], 
      portion_size: params[:portion_size]
    )

    redirect_to '/products/prepcenter'
  end

  def destroy
    @prepcenter_product = PrepcenterProduct.find(params[:id])

    @prepcenter_product.destroy

    redirect_to '/products/prepcenter'
  end


end
