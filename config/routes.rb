Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :quorum_members do
    resources :assignments
  end
  resources :households
  resources :quorums
  resources :users
  resources :wards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
