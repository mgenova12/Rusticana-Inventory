Rails.application.routes.draw do
  #rails d devise:controllers users

  root :to => 'stores#index'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', edit: 'edit_user'}, controllers: { registrations: "users/registrations" }
  
  # devise_for :users, controllers: { registrations: "registrations" }, skip: [:sessions]

  resources :users, only: [:index, :destroy]
  # post 'create_user' => 'users#create', as: :create_user

  
  get '/stores/new' => 'stores#new'
  post '/stores' => 'stores#create'

  scope :globals do
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

    get '/distributors' => 'distributors#index'
    get '/distributors/new' => 'distributors#new'
    post '/distributors' => 'distributors#create'
    get '/distributors/:id/edit' => 'distributors#edit'
    patch '/distributors/:id' => 'distributors#update'
    delete '/distributors/:id' => 'distributors#destroy'  
  end

  scope :product_prices do
    get '/prices' => 'prices#index'
    get '/prices/new' => 'prices#new'
    get '/prices/:distributor/new' => 'prices#new'
    get '/prices/date' => 'prices#date'
    post '/prices' => 'prices#create'
    get '/prices/:saved_price_id' => 'prices#show'
  end

  scope :financials do 
    get '/sales' => 'sales#index'
    get '/sales/:id/new' => 'sales#new'
    get '/sales/:id' => 'sales#show'
    post '/sales' => 'sales#create'
  end


  get '/:store/locations' => 'locations#index'
  get '/:store/locations/new' => 'locations#new'
  post '/:store/locations' => 'locations#create'
  get '/:store/locations/:id/edit' => 'locations#edit'
  patch '/:store/locations/:id' => 'locations#update'
  delete '/:store/locations/:id' => 'locations#destroy'

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

  get  '/:store/delivery_day' => 'inventories#delivery_day'

  get '/:store/inventory' => 'inventories#index'
  get '/:store/inventory/new' => 'inventories#new'
  post '/:store/inventory' => 'inventories#create'
  get '/:store/inventory/:order_id' => 'inventories#show'
  get '/:store/inventory/:distributor/:order_id' => 'inventories#show'
  get '/:store/inventory/:distributor/:zeros/:order_id' => 'inventories#show'

  get '/:store/orders' => 'orders#index'
  get '/:store/orders/:id/new' => 'orders#new'
  get '/:store/orders/:id/new/print' => 'orders#print'
  post '/:store/orders' => 'orders#create'
  get '/:store/orders/:id' => 'orders#show'

  get '/:store/quick_order' => 'quick_orders#index'
  post '/:store/quick_order' => 'quick_orders#create'
  patch '/:store/quick_order/edit' => 'quick_orders#update'
  delete '/:store/quick_order/:id' => 'quick_orders#destroy'

end
