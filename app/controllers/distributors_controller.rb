class DistributorsController < ApplicationController
  def index
    @distributors = Distributor.all
  end

  def new 

  end

  def create 
    @distributor = Distributor.new(
      name: params[:name]
    )
    
    if @distributor.save
      redirect_to '/globals/distributors'
    end
  end

  def edit 
    @distributor = Distributor.find(params[:id])
  end

  def update
    @distributor = Distributor.find(params[:id])

    @distributor.update(
      name: params[:name]
    )

    redirect_to '/globals/distributors'
  end

  def destroy
    @distributor = Distributor.find(params[:id])

    @products = Product.where(distributor: @distributor.name)
    
    @products.update_all(distributor: nil)
    
    @distributor.destroy

    redirect_to '/globals/distributors'
  end
end
