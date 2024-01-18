# frozen_string_literal: true

class Urid < ApplicationRecord
  NAMESPACES = %w[blog store forum].freeze

  belongs_to :resource, polymorphic: true

  validates :resource, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: { scope: :resource_type }

  def to_path
    return '/404.html' unless resource

    pluralized_path = resource_type.downcase.split('::').map do |e|
      next e if NAMESPACES.include? e

      ActiveSupport::Inflector.pluralize(e)
    end.join('/')

    "/#{[pluralized_path, slug || resource_id].join('/')}"
  end
end
