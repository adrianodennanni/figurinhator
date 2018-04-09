Rails.application.routes.draw do
  resources :figurinhas
  devise_for :users
  root to: 'figurinhas#index'
  post 'figurinhas/add_one' => 'figurinhas#add_one'
  post 'figurinhas/remove_one' => 'figurinhas#remove_one'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
