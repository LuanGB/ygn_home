# frozen_string_literal: true

class CreateUserAuthenticationProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :user_authentication_providers do |t|
      t.string :provider
      t.uuid :uuid
      t.jsonb :data

      t.timestamps
    end
  end
end
