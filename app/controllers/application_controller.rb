# frozen_string_literal: true

class ApplicationController < ActionController::Base

  private

  def find_resource
    urid = Urid.where(slug: params[:id]).or(Urid.where(uid: params[:id])).where(resource_type: resource_type).first
    raise ActionController::RoutingError.new('Not Found') unless urid

    urid.resource
  end

  def resource_type
    request.path.split('/')[1..-2].map(&:capitalize).map(&:singularize).join('::')
  end

  def resource_stylesheets; []; end
  helper_method :resource_stylesheets

  def page_config
    {
      page_title: "YGN"
    }
  end
  helper_method :page_config
end
