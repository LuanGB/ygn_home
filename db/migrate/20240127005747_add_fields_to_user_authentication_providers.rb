# frozen_string_literal: true

class AddFieldsToUserAuthenticationProviders < ActiveRecord::Migration[7.1]
  def change
    add_column :user_authentication_providers, :image_url, :string
    add_column :user_authentication_providers, :first_name, :string
    add_column :user_authentication_providers, :last_name, :string
    add_column :user_authentication_providers, :email, :string
    add_column :user_authentication_providers, :locale, :string
  end
end
