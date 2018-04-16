Rails.application.routes.draw do
  root 'idea#index'

  get '/new' => 'idea#new'
  post '/new' => 'idea#create'
  get '/idea/:id' => 'idea#show', as: 'idea'
  delete '/idea/:id' => 'idea#destroy', as: 'delete_idea'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get "/users/:name" => "users#show", as: 'profile_path'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/users/:name' => 'sessions#destroy', as: 'logout'
end
