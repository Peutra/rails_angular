Rails.application.routes.draw do
  root to: 'catch_all#index'
  get '*path', to: 'catch_all#index'
end
