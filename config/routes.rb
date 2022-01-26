Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end

  resources :profiles, only: [:index]
  get 'profiles/:username', to: 'profiles#show', as: :profile
  post '/profiles/:id/add_friend', to: 'profiles#add_friend', as: :add_friend
  post '/friendships/:id/accept', to: 'profiles#accept_friend', as: :accept_friend
  post '/friendships/:id/decline', to: 'profiles#decline_friend', as: :decline_friend

  resources :photos, only: [:index, :show, :new, :create, :destroy]

  resources :comments, only: [:create, :edit, :update, :destroy]

  root 'photos#index'

  get '*path', to: 'photos#index', constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }
end
