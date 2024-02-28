# frozen_string_literal: true

Rails.application.routes.draw do
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      unlocks: 'users/unlocks',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  end
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'launch#index'
  get '/:urid', to: 'site#find_resource',
                constraints: { urid: /[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}/ }

  namespace :api do
    namespace :v1 do
      post 'newsletter_subscription/subscribe', to: 'newsletter_subscription#create'
      resources :contacts, only: :create
    end
  end

  get '/blog', to: 'blog#index'
  namespace :blog do
    resources :authors, only: %i[show index]
    resources :categories, only: %i[index]
    resources :comments, only: %i[create update destroy]
    resources :posts, only: %i[index show]
    resources :tags, only: %i[index]
  end

  namespace :site do
    get 'contact'
    get 'home'
    get 'privacy'
    get 'terms'
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
