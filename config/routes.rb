Rails.application.routes.draw do
  resources :posts do |member|
    resources :comments
  end

  root "posts#index"
end
