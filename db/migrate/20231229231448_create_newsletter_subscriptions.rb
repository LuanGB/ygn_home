# frozen_string_literal: true

class CreateNewsletterSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :newsletter_subscriptions do |t|
      t.string :email

      t.timestamps
    end
  end
end
