Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :households
  resources :quorums do
    get 'quorum_members/search'
    resources :quorum_members do
      resources :assignments
    end
  end
  resources :reports
  resources :users
  resources :wards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
