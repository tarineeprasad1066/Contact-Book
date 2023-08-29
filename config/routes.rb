Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    root :to => 'home#index'
  end
  
  resources :contacts
  resources :users, :only =>[:show]
  post 'search', to: 'search#index', as: 'search'

  post 'search/suggestions', to: 'search#suggestions', as: 'search_suggestions'

end