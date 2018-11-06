class StoresController < ApplicationController
  
  def index
    @stores = Store.where(label: 'Store')
    @prepcenters = Store.where(label: 'PrepCenter')
  end

  def new 

  end

  def create 
    @store = Store.new(
      name: params[:name],
      label: params[:label]
    )

    if @store.save
      redirect_to '/'
    end
  end

  

end
