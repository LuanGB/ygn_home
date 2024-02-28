# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar

  devise :lockable, :database_authenticatable, :confirmable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google facebook twitch twitter discord]

  rolify

  has_many :authentication_providers, class_name: UserAuthenticationProvider.to_s, dependent: :destroy

  def self.from_omniauth(auth_data)
    authorization = UserAuthenticationProvider.find_by(provider: auth_data.provider, uuid: auth_data.uid)
    return authorization.user if authorization

    email = auth_data['info']['email']

    # match existing users
    existing_user = find_for_database_authentication(email: email.downcase)
    if existing_user
      existing_user.add_oauth_authorization(auth_data).save
      return existing_user
    end

    create_new_user_from_oauth(auth_data, email)
  end

  # Maintaining state if a user was not able to be saved
  def self.new_with_session(params, session)
    super.tap do |user|
      if (auth_data = session['devise.oauth.data'])
        user.email = auth_data['info']['email'] if user.email.blank?
        user.add_oauth_authorization(auth_data)
      end
    end
  end

  def add_oauth_authorization(auth_data)
    authentication_providers.build(
      provider: auth_data['provider'],
      uuid: auth_data['uid'],
      image_url: auth_data['info']['image'],
      first_name: auth_data['info']['first_name'],
      last_name: auth_data['info']['last_name'],
      email: auth_data['info']['email'],
      locale: auth_data['extra']['raw_info']['locale'],
      data: auth_data
    )
  end

  def self.create_new_user_from_oauth(auth_data, email)
    user = User.new({ email: email, password: Devise.friendly_token[0, 20] })
    user.skip_confirmation! if omniauth_providers.include?(auth_data.provider)
    user.add_oauth_authorization(auth_data)
    user.save
    user
  end
end
