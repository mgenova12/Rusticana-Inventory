class StoresController < ApplicationController
  authorize_resource 
  
  def index
    @stores = Store.where(label: 'Store')
    @prepcenters = Store.where(label: 'PrepCenter')
  end

  def new 

  end

  def create 
    @store = Store.new(
      name: params[:name].parameterize('_'),
      label: params[:label]
    )

    # if params[:label] == 'PrepCenter'
    #   Distributor.create(
    #     name: params[:name]
    #   )
    # end

    if @store.save
      redirect_to '/'
    end
  end

  

end
