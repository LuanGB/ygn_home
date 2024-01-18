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
  
  permit_params :title, :published_at, :content

  filter :title
  filter :published_at
  filter :created_at

  show do
    simple_format blog_post.html_safe_content
  end

  index do
    selectable_column
    id_column
    column :title
    column :published_at
    actions
  end

  form html: { :multipart => true } do |f|
    semantic_errors
    inputs "Details" do
      input :title
      input :published_at, label: "Publish Post At", as: :date_time_picker
      li "Created at #{f.object.created_at}" unless f.object.new_record?
    end
    inputs "Content" do
      input :content, label: false, as: :quill_editor, input_html: {
        data: {
          options: {
            modules: {
              'toolbar': [
                [{ 'font': [] }, { 'size': [] }],
                [ 'bold', 'italic', 'underline', 'strike' ],
                [{ 'color': [] }, { 'background': [] }],
                [{ 'script': 'super' }, { 'script': 'sub' }],
                [{ 'header': '1' }, { 'header': '2' }, 'blockquote', 'code-block' ],
                [{ 'list': 'ordered' }, { 'list': 'bullet'}, { 'indent': '-1' }, { 'indent': '+1' }],
                [ 'direction', { 'align': [] }],
                [ 'link', 'image', 'video', 'formula' ],
                [ 'clean' ]
              ]
            }
          }
        }
      }
    end
    actions
  end
end
