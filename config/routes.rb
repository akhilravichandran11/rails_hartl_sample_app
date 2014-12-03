Rails.application.routes.draw do
  get 'conference_rooms/new'

  root            'static_pages#home'
  get 'help' =>   'static_pages#help'
  get 'about' =>  'static_pages#about'
  get 'contact'=> 'static_pages#contact'
  get 'signup' => 'users#new'
  get 'login' =>  'sessions#new'
  get 'confcreate' => 'conference_rooms#new'
  post 'login' =>  'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :microposts, only: [:create, :destroy]
end
