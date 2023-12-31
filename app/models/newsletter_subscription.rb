class NewsletterSubscription < ApplicationRecord
  validates :email,
    uniqueness: true,
    presence: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.ransackable_attributes(auth_object = nil)
    ["email", "id"]
  end
end
