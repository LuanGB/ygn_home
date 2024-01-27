# frozen_string_literal: true

class AddUserToUserAuthenticationProvider < ActiveRecord::Migration[7.1]
  def change
    add_reference :user_authentication_providers, :user, null: false, foreign_key: true
  end
end
