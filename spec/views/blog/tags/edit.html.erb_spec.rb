# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blog/tags/edit' do
  let(:blog_tag) do
    Blog::Tag.create!(name: 'MyString')
  end

  before do
    assign(:blog_tag, blog_tag)
  end

  it 'renders the edit blog_tag form' do
    render

    assert_select 'form[action=?][method=?]', blog_tag_path(blog_tag), 'post' do
      assert_select 'input[name=?]', 'blog_tag[name]'
    end
  end
end
