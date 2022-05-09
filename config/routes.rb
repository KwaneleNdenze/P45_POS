Rails.application.routes.draw do
  #devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  resources :purchases
  get 'searchrange', to: "purchases#searchrange"
  get 'return_item/:id', to: "products#return_item", as: :return_item
  get 'searchform', to: "purchases#searchform"
  get 'performance_summary', to: "products#performance_summary", as: :performance_summary

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
end
