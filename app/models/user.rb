# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google facebook twitch twitter discord]

  rolify

  has_many :authentication_providers, class_name: UserAuthenticationProvider.to_s, dependent: :destroy

  def self.from_omniauth(auth)
    # find an existing user or create a user and authorizations
    # schema of auth https://github.com/omniauth/omniauth/wiki/Auth-Hash-Schema

    # returning users
    authorization = UserAuthenticationProvider.find_by(provider: auth.provider, uuid: auth.uid)
    return authorization.user if authorization

    email = auth['info']['email']

    # match existing users
    existing_user = find_for_database_authentication(email: email.downcase)
    if existing_user
      existing_user.add_oauth_authorization(auth).save
      return existing_user
    end

    create_new_user_from_oauth(auth, email)
  end

  # Maintaining state if a user was not able to be saved
  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.oauth.data'])
        user.email = data['info']['email'] if user.email.blank?
        user.add_oauth_authorization(data)
      end
    end
  end

  def add_oauth_authorization(data)
    authorizations.build({
                           provider: data['provider'],
                           uuid: data['uid'],
                           # token: data['credentials']['token'],
                           # secret: data['credentials']['secret'],
                           # refresh_token: data['credentials']['refresh_token'],
                           # expires: data['credentials']['expires'],
                           # expires_at: (Time.at(data['credentials']['expires_at']) rescue nil),
                           # Human readable label if a user connects multiple Google accounts
                           email: data['info']['email']
                         })
  end

  def self.create_new_user_from_oauth(auth, email)
    user = User.new({ email: email, username: email.split('@').first.delete('.'), password: Devise.friendly_token[0, 20] })
    user.skip_confirmation! if %w[google].include?(auth.provider)
    user.add_oauth_authorization(auth)
    user.save
    user
  end
end
