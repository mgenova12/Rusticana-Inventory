class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new 
    @locations = Location.all
  end

  def create

  end

end
