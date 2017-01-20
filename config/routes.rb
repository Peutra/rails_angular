Rails.application.routes.draw do

  scope(:path => '/api') do
    post '/register' => 'authentication#register', defaults: { format: 'json' }
  end

  root to: 'catch_all#index'
  get '*path', to: 'catch_all#index'
end
