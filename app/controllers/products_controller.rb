class ProductsController < ApplicationController

  def index
    @products = Product.order(:name)
  end

  def new 
    @distributors = Distributor.all
  end

  def create
    @product = Product.new(
      name: params[:name],
      measurement: params[:measurement],
      item_type: params[:item_type],
      case_quantity: params[:case_quantity],
      price: params[:price],
      markup: params[:markup],
      distributor: params[:distributor]
    )

    if @product.save
      redirect_to '/products'
    end
  end

  def edit
    @product = Product.find(params[:id])
    @distributors = Distributor.all
  end

  def update
    @product = Product.find(params[:id])

    @product.update(
      name: params[:name],
      measurement: params[:measurement],
      item_type: params[:item_type],
      case_quantity: params[:case_quantity],
      price: params[:price],
      markup: params[:markup],
      distributor: params[:distributor]      
    )

    redirect_to '/products'
  end

  def destroy
    @product = Product.find(params[:id])
    @prepped_product = PrepcenterProduct.find_by(product_id: params[:id])

    @prepped_product.destroy
    @product.destroy

    redirect_to '/products'
  end

end
