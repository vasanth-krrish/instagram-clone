Rails.application.routes.draw do

  resources :posts
  root 'posts#index'

  devise_for :users, controllers: { sessions: "sessions" }

  get '/:id' => 'home#profile', as: 'profile'
  get '/accounts/edit' => 'home#edit', as: 'edit_profile'
  post '/accounts/edit' => 'home#update', as: 'update_profile'

end
