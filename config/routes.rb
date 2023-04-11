Rails.application.routes.draw do
  devise_for :users
  resources :shared_movies

  root "shared_movies#index"
end
