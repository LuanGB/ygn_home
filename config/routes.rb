# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'site#home'

  namespace :api do
    namespace :v1 do
      post 'newsletter_subscription/subscribe', to: 'newsletter_subscription#create'
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
