# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blog/comments/index' do
  before do
    assign(:blog_comments,
           [Blog::Comment.create!(date: 'Date', content: 'Content'),
            Blog::Comment.create!(date: 'Date', content: 'Content')])
  end

  xit 'renders a list of blog/comments' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Date'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Content'.to_s), count: 2
  end
end
