Rails.application.routes.draw do
  resources :user, only: [:new, :create, :destroy]
  resources :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
     resources :users
  end
end
