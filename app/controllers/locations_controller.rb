class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new 
    @stores = Store.all
  end

  def create 
    @location = Location.new(
      name: params[:name],
      store_id: params[:store_id]
    )
    
    if @location.save
      redirect_to '/locations'
    end
  end

  def edit 
    @stores = Store.all
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    @location.update(
      name: params[:name],
      store_id: params[:store_id]
    )

    redirect_to '/locations'
  end

  def destroy
    @location = Location.find(params[:id])
    
    @location.destroy

    redirect_to '/locations'
  end

end
