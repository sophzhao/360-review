Rails.application.routes.draw do
  resources :analysis_results
  resources :sentences
  resources :reviews
  resources :business_owners

  get 'welcome' => 'business_owners#home'

  get 'login' => 'business_owners#login'

    get 'index' => 'business_owners#index'




#   get "business_owners/hello" => "your-controller#your/action"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
