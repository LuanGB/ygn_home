require 'rails_helper'

RSpec.describe "blog/tags/show", type: :view do
  before(:each) do
    assign(:blog_tag, Blog::Tag.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
