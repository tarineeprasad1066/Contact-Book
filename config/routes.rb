Rails.application.routes.draw do

  resources :contacts
  root 'home#index'
  devise_for :users
  
end