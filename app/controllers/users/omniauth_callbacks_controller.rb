# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google
      # A class method we need to define
      @user = User.from_omniauth(auth_data)

      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        # We couldn't save the user for some reason (i.e. need to add a username)
        # Removing extra as it can overflow some session stores
        data = auth_data.except('extra')
        # So data will be available after this request when creating the user
        session['devise.oauth.data'] = data
        msg = @user.errors.full_messages.join("\n")
        redirect_to new_user_registration_url, alert: msg
      end
    end

    private

    def auth_data
      request.env['omniauth.auth']
    end
  end
end
