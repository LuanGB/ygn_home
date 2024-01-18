require 'rails_helper'

RSpec.describe "blog/comments/edit", type: :view do
  let(:blog_comment) {
    Blog::Comment.create!(
      date: "MyString",
      content: "MyString"
    )
  }

  before(:each) do
    assign(:blog_comment, blog_comment)
  end

  it "renders the edit blog_comment form" do
    render

    assert_select "form[action=?][method=?]", blog_comment_path(blog_comment), "post" do

      assert_select "input[name=?]", "blog_comment[date]"

      assert_select "input[name=?]", "blog_comment[content]"
    end
  end
end
