# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV.fetch('FACEBOOK_APP_ID', nil), ENV.fetch('FACEBOOK_APP_SECRET', nil), scope: 'email,user_birthday,read_stream', display: 'popup'
  provider :google_oauth2, ENV.fetch('GOOGLE_OAUTH_CLIENT_ID', nil), ENV.fetch('GOOGLE_OAUTH_CLIENT_SECRET', nil), name: :google
end
