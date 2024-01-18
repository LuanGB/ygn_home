require 'rails_helper'

RSpec.describe "blog/comments/show", type: :view do
  before(:each) do
    assign(:blog_comment, Blog::Comment.create!(
      date: "Date",
      content: "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Date/)
    expect(rendered).to match(/Content/)
  end
end
