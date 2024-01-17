require 'rails_helper'

RSpec.describe "blog/posts/new", type: :view do
  before(:each) do
    assign(:blog_post, Blog::Post.new(
      title: "MyString",
      content: "MyString"
    ))
  end

  it "renders new blog_post form" do
    render

    assert_select "form[action=?][method=?]", blog_posts_path, "post" do

      assert_select "input[name=?]", "blog_post[title]"

      assert_select "input[name=?]", "blog_post[content]"
    end
  end
end
