json.extract! blog_author, :id, :name, :bio, :created_at, :updated_at
json.url blog_author_url(blog_author, format: :json)
