Rails.application.routes.draw do

  scope(:path => '/api') do
    constraints format: :json do
      post '/register' => 'authentication#register'
      post '/login' => 'authentication#login'
      post '/products' => 'products#create'
      get '/products' => 'products#index'
      put '/products/:id' => 'products#update'
      get '/products/:id' => 'products#read'
      delete '/products/:id' => 'products#read'
      post '/vote' => 'users#vote'
      get '/vote' => 'users#current_vote'
      post '/rate_product' => 'users#rate_product'
      get '/current_rate' => 'products#current_rate'
    end
  end

  root to: 'catch_all#index'
  get '*path', to: 'catch_all#index'
end
