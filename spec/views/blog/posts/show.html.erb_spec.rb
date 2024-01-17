require 'rails_helper'

RSpec.describe "blog/posts/show", type: :view do
  before(:each) do
    assign(:blog_post, Blog::Post.create!(
      title: "Title",
      content: "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
  end
end
