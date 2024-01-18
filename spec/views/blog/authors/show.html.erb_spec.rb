require 'rails_helper'

RSpec.describe "blog/authors/show", type: :view do
  before(:each) do
    assign(:blog_author, Blog::Author.create!(
      name: "Name",
      bio: "Bio"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Bio/)
  end
end
