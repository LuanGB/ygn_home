# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blog/authors/edit' do
  let(:blog_author) do
    Blog::Author.create!(name: 'MyString', bio: 'MyString', avatar: File.open(Rails.root.join('spec', 'fixtures', 'image.jpg')))
  end

  before do
    assign(:blog_author, blog_author)
  end

  it 'renders the edit blog_author form' do
    render

    assert_select 'form[action=?][method=?]', blog_author_path(blog_author), 'post' do
      assert_select 'input[name=?]', 'blog_author[name]'

      assert_select 'input[name=?]', 'blog_author[bio]'
    end
  end
end
