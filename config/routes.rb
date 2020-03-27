Rails.application.routes.draw do
  # get 'purchase/index'
  # get 'purchase/done'
  # get 'creditcards/new'
  # get 'creditcards/show'
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :edit, :show, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :photos, only: [:index] 
  end
  resources :users, only: [:show] do
    resources :addresses, only: [:new, :create, :index, :edit]
    resources :creditcards, only: [:new, :show] do
      collection do
        post 'show', to: 'creditcards#show'
        post 'pay', to: 'creditcards#pay'
        post 'delete', to: 'creditcards#delete'
      end
    end
    resources :purchase, only: [:index] do
      collection do
        get 'index', to: 'purchase#index'
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
