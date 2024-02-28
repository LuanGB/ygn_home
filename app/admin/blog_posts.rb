# frozen_string_literal: true

ActiveAdmin.register Blog::Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :content, :published_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :content, :published_at]
  #   permitted << :other if params[:action] == "create" && current_user.admin?
  #   permitted
  # end

  controller do
    def create
      super

      slug = resource.title.downcase.tr(' ', '-').dasherize
      Urid.create resource: resource, uid: SecureRandom.uuid, slug: slug
    end

    def update
      super

      slug = resource.title.downcase.tr(' ', '-').dasherize
      urid = Urid.find_or_initialize_by(resource: resource, slug: slug)
      return if urid.persisted?

      urid.uid = SecureRandom.uuid
      urid.save
    end
  end

  permit_params :title, :description, :published_at, :content, :cover, :thumbnail, :urid, author_ids: [], category_ids: [], tag_ids: []

  collection_action :upload, method: [:post] do
    result = { success: resource.content_files.attach(params[:file_upload]) }
    result[:url] = url_for(resource.content_files.last) if result[:success]
    render json: result
  end

  filter :title
  filter :published_at
  filter :created_at

  show do
    attributes_table do
      row :title
      row :link do |post|
        link_to post.title, "/#{post.uid}"
      end
      row :description
      row :authors
      row :categories
      row :tags
      row :published_at
      row :cover do |post|
        image_tag post.cover_path, width: '1280px'
      end
      row :thumbnail do |post|
        image_tag post.thumbnail_path, width: '720px'
      end
    end
    attributes_table do
      row :html_safe_content
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :published_at
    actions
  end

  form html: { multipart: true } do |f|
    semantic_errors
    inputs 'Details' do
      input :title
      input :description, as: :string
      input :published_at, label: 'Publish Post At', as: :date_time_picker
      input :authors, as: :select_2_multiple, collection: Blog::Author.all
      input :categories, as: :select_2_multiple, collection: Blog::Category.all
      input :tags, as: :select_2_multiple, collection: Blog::Tag.all
      input :cover, as: :file, hint: !object.new_record? && image_tag(object.cover_path, width: '1280px')
      input :thumbnail, as: :file, hint: !object.new_record? && image_tag(object.thumbnail_path, width: '720px')
      li "Created at #{f.object.created_at}" unless f.object.new_record?
    end
    inputs 'Content' do
      input :content, label: false, as: :quill_editor, input_html: {
        data: {
          options: {
            modules: {
              toolbar: [
                [{ font: [] }, { size: [] }],
                %w[bold italic underline strike],
                [{ color: [] }, { background: [] }],
                [{ script: 'super' }, { script: 'sub' }],
                [{ header: '1' }, { header: '2' }, 'blockquote', 'code-block'],
                [{ list: 'ordered' }, { list: 'bullet' }, { indent: '-1' }, { indent: '+1' }],
                ['direction', { align: [] }],
                %w[link image video formula],
                ['clean']
              ]
            }
          },
          plugins: { image_uploader: { server_url: upload_admin_blog_posts_path, field_name: 'file_upload' } }
        }
      }
    end
    actions
  end
end
