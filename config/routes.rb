Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :posts do |member|
    resources :comments
  end

  root "pages#index"

  get '/about', to: 'pages#about'
  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/posts', to: 'dashboard#posts'
  get '/dashboard/users', to: 'dashboard#users'
  get '/dashboard/users/:id', to: 'dashboard#promote'
  put '/dashboard/users/:id', to: 'dashboard#promote'
  get '/dashboard/users/delete/:id', to: 'dashboard#destroy'
  get '/dashboard/settings', to: 'dashboard#settings'
  get '/dashboard/user', to: 'dashboard#user_edit'

  get '/dashboard/user_edit/:id', to: 'dashboard#user_edit', :as => :user
  post '/dashboard/user_edit/:id', to: 'dashboard#user_update'
  patch '/dashboard/user_edit/:id', to: 'dashboard#user_update'
  
end
