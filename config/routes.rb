Rails.application.routes.draw do
  root "site#home"

  namespace :api do
    namespace :v1 do
      post 'newsletter_subscription/subscribe', to: 'newsletter_subscription#create'
    end
  end
  
  get "up" => "rails/health#show", as: :rails_health_check
end
