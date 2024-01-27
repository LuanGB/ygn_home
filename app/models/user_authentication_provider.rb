# frozen_string_literal: true

class UserAuthenticationProvider < ApplicationRecord
  belongs_to :user, optional: true
  validates :uuid, uniqueness: { scope: :provider }
end
