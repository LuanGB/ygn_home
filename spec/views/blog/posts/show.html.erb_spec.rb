# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blog/posts/show' do
  before do
    assign(:blog_post, Blog::Post.create!(title: 'Title', content: 'Content'))
  end

  xit 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
  end
end
