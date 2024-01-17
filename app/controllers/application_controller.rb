# frozen_string_literal: true

class ApplicationController < ActionController::Base

  private

  def resource_stylesheet; end
  helper_method :resource_stylesheet
end
