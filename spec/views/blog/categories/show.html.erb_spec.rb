require 'rails_helper'

RSpec.describe "blog/categories/show", type: :view do
  before(:each) do
    assign(:blog_category, Blog::Category.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
