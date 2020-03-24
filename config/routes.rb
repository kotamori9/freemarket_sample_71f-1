Rails.application.routes.draw do
  # get 'creditcards/new'
  # get 'creditcards/show'
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create]
  resources :users, only: [:show] do
    resources :addresses, only: [:new, :create]
    resources :creditcards, only: [:new, :show, :destroy] do
      collection do
        post 'pay', to: 'creditcards#pay'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
