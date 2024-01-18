# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blog/posts/index' do
  before do
    assign(:blog_posts, [Blog::Post.create!(title: 'Title', content: 'Content'), Blog::Post.create!(title: 'Title', content: 'Content')])
  end

  xit 'renders a list of blog/posts' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Content'.to_s), count: 2
  end
end
