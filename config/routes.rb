Rails.application.routes.draw do

  root :to => 'stores#index'

  get '/stores/new' => 'stores#new'
  post '/stores' => 'stores#create'

  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post 'products' => 'products#create'

  get '/locations' => 'locations#index'
  get '/locations/new' => 'locations#new'
  post '/locations' => 'locations#create'
  get '/locations/:id/edit' => 'locations#edit'
  patch '/locations/:id' => 'locations#update'
  delete '/locations/:id' => 'locations#destroy'

  get '/distributors' => 'distributors#index'
  get '/distributors/new' => 'distributors#new'
  post '/distributors' => 'distributors#create'
  get '/distributors/:id/edit' => 'distributors#edit'
  patch '/distributors/:id' => 'distributors#update'
  delete '/distributors/:id' => 'distributors#destroy'  

end
