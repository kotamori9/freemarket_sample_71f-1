Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resource :items, only: [:index,:new,:create,:show]
  resource :users, only: [:show] do
    resource :addresses, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
