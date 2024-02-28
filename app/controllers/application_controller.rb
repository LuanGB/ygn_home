# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_breadcrumbs, :set_page_config, :set_page_content

  if Rails.env.production?
    rescue_from('Exception') do |e|
      render 'errors/500', status: :internal_server_error, layout: nil and Rails.logger.error e
    end
    rescue_from('ActionController::RoutingError', 'ActiveRecord::RecordNotFound') { render 'errors/404', status: :not_found, layout: nil }
  end

  private

  def find_resource
    resource_type = request.path.split('/')[1..-2].map(&:capitalize).map(&:singularize).join('::')
    urid = Urid.where(slug: params[:id]).or(Urid.where(uid: params[:id])).where(resource_type: resource_type).first
    raise ActionController::RoutingError, 'Not Found' unless urid

    urid.resource
  end

  def breadcrumbs
    @breadcrumbs ||= []
  end
  helper_method :breadcrumbs

  def set_breadcrumbs
    add_breadcrumb('Home', root_path)
  end

  def add_breadcrumb(name, path = nil)
    breadcrumbs << Breadcrumb.new(name, path)
  end

  def page_config
    @page_config ||= {}
  end
  helper_method :page_config

  def add_page_config(key, value)
    page_config
    @page_config.merge!(key => value)
  end

  def set_page_config
    default_config = SiteConfig.active
    add_page_config(:page_title, default_config.site_title)
    add_page_config(:site_nav_logo_url_path, default_config.site_nav_logo_url_path)
    add_page_config(:site_nav_logo_image_path, default_config.site_nav_logo_image_path)
  end

  def page_content
    @page_content ||= {}
  end
  helper_method :page_content

  def add_page_content(key, value)
    page_content
    @page_content.merge!(key => value)
  end

  def set_page_content
    add_page_content(:latest_posts, Blog::Post.last(2))
  end

  def resource_stylesheets
    []
  end
  helper_method :resource_stylesheets
end
