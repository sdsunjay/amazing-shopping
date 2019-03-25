Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    resources :users, only: [:show]
    authenticated :user do
      resources :products, only: [:new, :create, :index, :show, :edit, :destroy, :update]
      resources :orders, only: [:new, :create, :index, :show, :edit, :destroy, :update]
      resources :inventories, only: [:new, :create, :index, :show, :edit, :destroy, :update]
     end
  end
  root to: "users#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
