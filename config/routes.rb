Rails.application.routes.draw do
  resources :sentences
  resources :reviews
  resources :business_owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
