Rails.application.routes.draw do
  Healthcheck.routes(self)
  root 'authors#index'
  resources :authors
  resources :books
end
