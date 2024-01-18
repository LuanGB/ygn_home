# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  ActiveAdmin.routes(self)
  
  root 'launch#index'
  get '/:urid', to: 'site#find_resource', constraints: { urid: /[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}/ }

  namespace :api do
    namespace :v1 do
      post 'newsletter_subscription/subscribe', to: 'newsletter_subscription#create'
    end
  end
  
  namespace :blog do
    resources :comments, only: [:create, :update]
    resources :tags, only: [:index, :show]
    resources :categories, only: [:index, :show]
    resources :authors, only: [:index, :show]
    resources :posts, only: [:index, :show]
  end
  
  namespace :site do
    get 'home'
    get 'contact'
    get 'terms'
    get 'privacy'
  end
  
  get 'up' => 'rails/health#show', as: :rails_health_check
end
