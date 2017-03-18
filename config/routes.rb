Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :assignments
  resources :quorum_members
  resources :households
  resources :quorums
  resources :users
  resources :wards
  resources :thingies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
