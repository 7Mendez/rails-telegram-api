require 'sidekiq/web'

Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  devise_scope :user do
    authenticated :user do
      mount Sidekiq::Web => '/sidekiq'
    end
  end

  get 'home', to: 'home#index'
  get 'app', to: 'home#app'

end
