class NewsletterSubscription < ApplicationRecord
  validates :email,
    uniqueness: true,
    presence: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }
end
