require 'rails_helper'

RSpec.describe "blog/authors/edit", type: :view do
  let(:blog_author) {
    Blog::Author.create!(
      name: "MyString",
      bio: "MyString"
    )
  }

  before(:each) do
    assign(:blog_author, blog_author)
  end

  it "renders the edit blog_author form" do
    render

    assert_select "form[action=?][method=?]", blog_author_path(blog_author), "post" do

      assert_select "input[name=?]", "blog_author[name]"

      assert_select "input[name=?]", "blog_author[bio]"
    end
  end
end
