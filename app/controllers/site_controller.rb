class SiteController < ApplicationController
  def home
  end

  def contact
  end

  def terms
  end

  def privacy
  end

  def find_resource
    urid = Urid.find_by(uid: params[:urid])

    raise ActionController::RoutingError.new('Not Found') unless urid

    redirect_to urid.to_path
  end
end
