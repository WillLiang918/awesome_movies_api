Rails.application.routes.draw do
  namespace :api do
    resources :movies, only: [:index, :show]
  end
end
