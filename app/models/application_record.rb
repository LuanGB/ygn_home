# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.ransackable_attributes(_auth_object = nil)
    self.columns.map(&:name) - self.reflect_on_all_attachments.map(&:name)
  end

  def self.ransackable_associations(auth_object = nil)
    self.reflect_on_all_associations.map(&:name)
  end
end
