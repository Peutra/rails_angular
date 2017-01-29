Rails.application.routes.draw do

  scope(:path => '/api') do
    constraints format: :json do
      # AUTH
      post '/register' => 'authentication#register'
      post '/login' => 'authentication#login'
      # PRODUCTS
      post '/products' => 'products#create'
      get '/products' => 'products#index'
      put '/products/:id' => 'products#update'
      get '/products/:id' => 'products#read'
      delete '/products/:id' => 'products#read'
      # VOTE
      post '/vote' => 'users#vote'
      get '/vote' => 'users#current_vote'
      # RATE
      post '/rate_product' => 'users#rate_product'
      get '/current_rate' => 'products#current_rate'
      # CREDITS MGMT
      get '/credits' => 'users#credits'
      # BID MGMT
      post '/bids/create' => 'bids#create'

    end
  end

  root to: 'catch_all#index'
  get '*path', to: 'catch_all#index'
end
