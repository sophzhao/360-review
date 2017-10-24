Rails.application.routes.draw do

  # Generated resources for models
  resources :analysis_results
  resources :sentences
  resources :reviews
  resources :business_owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Setting up home route and making it the root url
  get 'home', to: 'home#index', as: :home
  root 'home#index'


end
