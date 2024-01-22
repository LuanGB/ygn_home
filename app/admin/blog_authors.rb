# frozen_string_literal: true

ActiveAdmin.register Blog::Author do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :bio
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :bio]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :name
  permit_params :name, :bio, :avatar

  show do
    attributes_table do
      row :name
      row :bio
      row :avatar do |author|
        image_tag author.avatar_path, width: '90px'
      end
    end
  end

  form html: { multipart: true } do |_f|
    semantic_errors
    inputs do
      input :name
      input :bio, as: :text
      input :avatar, as: :file, hint: image_tag(object.avatar_path, width: '360px')
    end
    actions
  end
end
