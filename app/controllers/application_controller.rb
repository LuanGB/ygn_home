# frozen_string_literal: true

class ApplicationController < ActionController::Base
  if Rails.env.production?
    rescue_from('Exception') do |e|
      render 'errors/500', status: :internal_server_error, layout: nil and Rails.logger.error e
    end
    rescue_from('ActionController::RoutingError') { render 'errors/404', status: :not_found, layout: nil }
  end

  private

  def find_resource
    urid = Urid.where(slug: params[:id]).or(Urid.where(uid: params[:id])).where(resource_type: resource_type).first
    raise ActionController::RoutingError, 'Not Found' unless urid

    urid.resource
  end

  def resource_type
    request.path.split('/')[1..-2].map(&:capitalize).map(&:singularize).join('::')
  end

  def resource_stylesheets
    []
  end
  helper_method :resource_stylesheets

  def page_content
    {
      latest_posts: Blog::Post.last(2)
    }
  end
  helper_method :page_content

  def page_config
    {
      page_title: 'YGN'
    }
  end
  helper_method :page_config
end
