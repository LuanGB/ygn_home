require 'rails_helper'

RSpec.describe "blog/posts/edit", type: :view do
  let(:blog_post) {
    Blog::Post.create!(
      title: "MyString",
      content: "MyString"
    )
  }

  before(:each) do
    assign(:blog_post, blog_post)
  end

  it "renders the edit blog_post form" do
    render

    assert_select "form[action=?][method=?]", blog_post_path(blog_post), "post" do

      assert_select "input[name=?]", "blog_post[title]"

      assert_select "input[name=?]", "blog_post[content]"
    end
  end
end
