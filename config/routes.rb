Rails.application.routes.draw do
  namespace :api do
    resources :movies, only: [:index, :show]
  end
  resources :api_keys, except: [:new, :destroy]
  resources :users, except: [:new, :edit, :destroy]
  post 'session' => 'session#create'
end
