Rails.application.routes.draw do
  root :to => 'stores#index'

  get '/stores/new' => 'stores#new'
  post '/stores' => 'stores#create'

  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post 'products' => 'products#create'
  
end
