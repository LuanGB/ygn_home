# frozen_string_literal: true

ActiveAdmin.register Blog::Category do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :name
  permit_params :name, :background_color, :text_color

  form do |_f|
    semantic_errors
    inputs do
      input :name
      input :background_color, input_html: { class: 'colorpicker' }
      input :text_color, input_html: { class: 'colorpicker' }
    end
    actions
  end
end
