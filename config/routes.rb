Rails.application.routes.draw do
  root to: redirect('sign_in')

  get 'sign_in', to: 'sessions#new', as: 'new_session'
  post 'sign_in', to: 'sessions#create', as: 'sessions'
  delete 'sign_out', to: 'sessions#destroy'

  ActiveAdmin.routes(self)
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
  resources :wards do
    resources :quorums
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
