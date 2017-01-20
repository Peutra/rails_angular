Rails.application.routes.draw do

  scope(:path => '/api') do
    constraints format: :json do
      post '/register' => 'authentication#register'
      post '/login' => 'authentication#login'
    end
  end

  root to: 'catch_all#index'
  get '*path', to: 'catch_all#index'
end
