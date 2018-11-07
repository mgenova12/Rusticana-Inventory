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
      redirect_to '/distributors'
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

    redirect_to '/distributors'
  end

  def destroy
    @distributor = Distributor.find(params[:id])
    
    @distributor.destroy

    redirect_to '/distributors'
  end
end
