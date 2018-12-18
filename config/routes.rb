Rails.application.routes.draw do

  root :to => 'stores#index'

  get '/stores/new' => 'stores#new'
  post '/stores' => 'stores#create'

  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'

  get '/products/prepcenter' => 'prepcenter_products#index'
  get '/products/prepcenter/:id/new' => 'prepcenter_products#new'
  post '/products/prepcenter' => 'prepcenter_products#create'
  get '/products/prepcenter/:id/edit' => 'prepcenter_products#edit'
  patch '/products/prepcenter/:id' => 'prepcenter_products#update'
  delete '/products/prepcenter/:id' => 'prepcenter_products#destroy'

  get '/:store/locations' => 'locations#index'
  get '/:store/locations/new' => 'locations#new'
  post '/:store/locations' => 'locations#create'
  get '/:store/locations/:id/edit' => 'locations#edit'
  patch '/:store/locations/:id' => 'locations#update'
  delete '/:store/locations/:id' => 'locations#destroy'

  get '/distributors' => 'distributors#index'
  get '/distributors/new' => 'distributors#new'
  post '/distributors' => 'distributors#create'
  get '/distributors/:id/edit' => 'distributors#edit'
  patch '/distributors/:id' => 'distributors#update'
  delete '/distributors/:id' => 'distributors#destroy'  

  get '/:store/products' => 'store_goods#index'
  get '/:store/products/add' => 'store_goods#add' 
  get '/:store/products/add/:id/new' => 'store_goods#new'
  post '/:store/products/add/:id' => 'store_goods#create'
  get '/:store/products/:id/edit' => 'store_goods#edit'
  patch '/:store/products/:id' => 'store_goods#update'
  delete '/:store/products/:id' => 'store_goods#destroy'

  get '/:store/products/prepcenter/add/:id/new' => 'prepped_store_goods#new'
  post '/:store/products/prepcenter/add/:id' => 'prepped_store_goods#create'
  get '/:store/products/prepcenter/:id/edit' => 'prepped_store_goods#edit'
  patch '/:store/products/prepcenter/:id' => 'prepped_store_goods#update'
  delete '/:store/products/prepcenter/:id' => 'prepped_store_goods#destroy'

  get '/prices' => 'prices#index'
  get '/prices/new' => 'prices#new'

  get '/prices/:distributor/new' => 'prices#new'

  get '/prices/date' => 'prices#date'
  post '/prices' => 'prices#create'
  get '/prices/:saved_price_id' => 'prices#show'


end
