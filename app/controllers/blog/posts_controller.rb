class Blog::PostsController < BlogController
  # GET /blog/posts or /blog/posts.json
  def index
    @blog_posts = Blog::Post.all
  end

  # GET /blog/posts/1 or /blog/posts/1.json
  def show
    @blog_post = find_resource
  end
end
