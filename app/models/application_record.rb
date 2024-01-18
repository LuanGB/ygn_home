# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.ransackable_attributes(_auth_object = nil)
    columns.map(&:name) - reflect_on_all_attachments.map(&:name)
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map(&:name)
  end
end
