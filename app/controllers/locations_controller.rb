class LocationsController < ApplicationController
  authorize_resource
  def index
    store_id = Store.find_by(name: params[:store]).id
    @locations = Location.where(store_id: store_id).order(:row_num)
  end

  def new 
    @store_id = Store.find_by(name: params[:store]).id
  end

  def create 
    store_id = Store.find_by(name: params[:store]).id

    @location = Location.new(
      name: params[:name],
      store_id: store_id
    )
    
    if @location.save
      redirect_to "/#{params[:store]}/locations"
    end
  end

  def edit 
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    @location.update(
      name: params[:name],
      row_num: params[:row_num]
    )

    redirect_to "/#{params[:store]}/locations"
  end

  def destroy
    @location = Location.find(params[:id])
    
    @location.destroy

    redirect_to "/#{params[:store]}/locations"
  end

end
