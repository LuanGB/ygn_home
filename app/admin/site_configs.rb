# frozen_string_literal: true

ActiveAdmin.register SiteConfig do
  filter :name

  permit_params :name, :active, :shareable_socials, :socials,
                :site_title, :site_nav_logo_url_path, :site_nav_logo_image,
                :facebook_url, :instagram_url, :youtube_url, :twitter_url, :twitch_url,
                :facebook_share_url, :twitter_share_url, :copy_paste_share_url

  show do
    attributes_table do
      row :name
      row :active
      row :site_title
      row :site_nav_logo_url_path
      row :socials
      row :shareable_socials
      row :site_nav_logo_image do |config|
        image_tag config.site_nav_logo_image_path, style: 'max-width: 50%; background: gray'
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :active
    actions
  end

  form html: { multipart: true } do |_f|
    semantic_errors
    inputs do
      input :name, as: :string
      input :active, as: :boolean
      input :site_title, as: :string
      input :site_nav_logo_url_path, as: :string
      input :socials, as: :jsonb
      input :shareable_socials, as: :jsonb
      input :site_nav_logo_image, as: :file, hint: !object.new_record? && image_tag(object.site_nav_logo_image_path, style: 'max-width: 75%; background: gray')
    end
    actions
  end
end
