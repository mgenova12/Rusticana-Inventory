Rails.application.routes.draw do
  root :to => 'stores#index'

  get '/stores/new' => 'stores#new'
  post '/stores' => 'stores#create'


end
