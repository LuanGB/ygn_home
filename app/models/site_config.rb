# frozen_string_literal: true

class SiteConfig < ApplicationRecord
  include AttrJson::Record

  has_one_attached :site_nav_logo_image
  include AttachmentsUrls

  class Socials
    include AttrJson::Model

    attr_json :name, :string
    attr_json :url, :string
  end

  attr_json :site_title, :string
  attr_json :site_nav_logo_url_path, :string

  attr_json :facebook_url, :string
  attr_json :instagram_url, :string
  attr_json :youtube_url, :string
  attr_json :twitter_url, :string
  attr_json :twitch_url, :string

  attr_json :facebook_share_url, :string
  attr_json :twitter_share_url, :string

  attr_json :socials, Socials.to_type, array: true
  attr_json :shareable_socials, Socials.to_type, array: true

  validates :active, uniqueness: { conditions: -> { where(active: true) } }

  before_validation do
    SiteConfig.where.not(id: id).update_all(active: false) if active?
  end

  def self.active
    Rails.cache.fetch('active_site_config', expires_in: 1.minute) do
      find_by(active: true)
    end || new
  end

  def socials=(value)
    return if value.is_a?(Array) || value.is_a?(Hash)

    super(JSON.parse(value))
  end

  def shareable_socials=(value)
    return if value.is_a?(Array) || value.is_a?(Hash)

    super(JSON.parse(value))
  end

  # def socials
  #   [
  #     { "name": "facebook", "url": "https://facebook.com/yggdrasilgeeknetwork" },
  #     { "name": "instagram", "url": "https://instagram.com/yggdrasilgeeknetwork" },
  #     { "name": "youtube", "url": "https://youtube.com/yggdrasilgeeknetwork" },
  #     { "name": "twitter", "url": "https://twitter.com/yggdrasilgeeknetwork" },
  #     { "name": "twitch", "url": "https://twitch.com/yggdrasilgeeknetwork" }
  #   ]
  # end

  # def shareable_socials
  #   [
  #     { "name": "facebook", "url": "https://www.facebook.com/sharer.php?u=<URI>" },
  #     { "name": "twitter", "url": "https://twitter.com/intent/post?text=<URI>" }
  #   ]
  # end
end
