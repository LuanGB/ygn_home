require 'rails_helper'

RSpec.describe "blog/tags/new", type: :view do
  before(:each) do
    assign(:blog_tag, Blog::Tag.new(
      name: "MyString"
    ))
  end

  it "renders new blog_tag form" do
    render

    assert_select "form[action=?][method=?]", blog_tags_path, "post" do

      assert_select "input[name=?]", "blog_tag[name]"
    end
  end
end
