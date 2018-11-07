class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new 

  end

  def create 
    @location = Location.new(
      name: params[:name]
    )
    
    if @location.save
      redirect_to '/locations'
    end
  end

  def edit 
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    @location.update(
      name: params[:name]
    )

    redirect_to '/locations'
  end

  def destroy
    @location = Location.find(params[:id])
    
    @location.destroy

    redirect_to '/locations'
  end

end
