# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blog/comments/new' do
  before do
    assign(:blog_comment, Blog::Comment.new(date: 'MyString', content: 'MyString'))
  end

  it 'renders new blog_comment form' do
    render

    assert_select 'form[action=?][method=?]', blog_comments_path, 'post' do
      assert_select 'input[name=?]', 'blog_comment[date]'

      assert_select 'input[name=?]', 'blog_comment[content]'
    end
  end
end
