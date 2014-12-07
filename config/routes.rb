Rails.application.routes.draw do

  root            'static_pages#home'
  get 'help' =>   'static_pages#help'
  get 'about' =>  'static_pages#about'
  get 'contact'=> 'static_pages#contact'
  get 'signup' => 'users#new'
 ## get 'confroombookings' => 'confroombooking#index'
  ##post 'confroombookings' => 'confroombooking#index'
 ## post "confroombookings\new"
  get 'login' =>  'sessions#new'
  post 'login' =>  'sessions#create'
  delete 'logout' => 'session#destroy'
  resources :users
  resources :microposts, only: [:create, :destroy]
  resources :rooms
  resources :confroombookings
end
