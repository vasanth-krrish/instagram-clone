Rails.application.routes.draw do

  resources :posts do
    member do
      put 'like', to: "posts#like"
      put 'unlike', to: "posts#unlike"
    end
  end
  root 'posts#index'

  devise_for :users, controllers: { sessions: "sessions", registrations: 'registrations' }

  post '/follow/:id' => 'followings#create', as: 'follow'
  delete '/follow/:id' => 'followings#destroy', as: 'unfollow'

  get '/accounts' => 'home#accounts', as: 'accounts'

  get '/:id' => 'home#profile', as: 'profile'
  get '/accounts/edit' => 'home#edit', as: 'edit_profile'
  post '/accounts/edit' => 'home#update', as: 'update_profile'
  get '/accounts/password' => 'home#edit_password', as: 'edit_password'
  post '/accounts/password' => 'home#update_password', as: 'update_password'

  delete '/user/delete' => 'home#destroy', as: 'delete_user'

end
