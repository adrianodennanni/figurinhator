Rails.application.routes.draw do
  resources :figurinhas
  devise_for :users
  root to: 'figurinhas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
