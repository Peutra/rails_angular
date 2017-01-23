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
    end
  end

  root to: 'catch_all#index'
  get '*path', to: 'catch_all#index'
end
