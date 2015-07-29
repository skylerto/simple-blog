Rails.application.routes.draw do
  devise_for :users
  resources :posts do |member|
    resources :comments
  end

  root "posts#index"

  get '/about', to: 'pages#about'
  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/posts', to: 'dashboard#posts'
  get '/dashboard/users', to: 'dashboard#users'
  get '/dashboard/users/:id', to: 'dashboard#promote'
  put '/dashboard/users/:id', to: 'dashboard#promote'
  get '/dashboard/users/delete/:id', to: 'dashboard#destroy'

end
