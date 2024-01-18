# frozen_string_literal: true

ActiveAdmin.register Urid do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :resource_type, :resource_id, :slug, :uid
  #
  # or
  #
  # permit_params do
  #   permitted = [:resource_type, :resource_id, :slug, :uid]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |_f|
    semantic_errors
    inputs do
      input :resource_type
      input :resource_id
      input :slug
      input :uid, as: :string
    end
    actions
  end
end
