# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blog/authors/new' do
  before do
    assign(:blog_author, Blog::Author.new(name: 'MyString', bio: 'MyString'))
  end

  it 'renders new blog_author form' do
    render

    assert_select 'form[action=?][method=?]', blog_authors_path, 'post' do
      assert_select 'input[name=?]', 'blog_author[name]'

      assert_select 'input[name=?]', 'blog_author[bio]'
    end
  end
end
