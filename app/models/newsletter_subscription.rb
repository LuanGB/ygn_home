# frozen_string_literal: true

class NewsletterSubscription < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.ransackable_attributes(_auth_object = nil)
    %w[email id]
  end
end
