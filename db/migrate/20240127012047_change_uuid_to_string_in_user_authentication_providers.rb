# frozen_string_literal: true

class ChangeUuidToStringInUserAuthenticationProviders < ActiveRecord::Migration[7.1]
  def change
    change_column(:user_authentication_providers, :uuid, :string)
  end
end
