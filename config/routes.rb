Rails.application.routes.draw do
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy ]
  resources :articles
  get 'signup', to: 'users#new'
  #post 'users', to: 'users#create' #same ass rad under
  resources :users, except: [:new]
end
