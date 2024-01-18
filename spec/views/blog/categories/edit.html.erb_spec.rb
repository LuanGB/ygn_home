# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blog/categories/edit' do
  let(:blog_category) do
    Blog::Category.create!(name: 'MyString')
  end

  before do
    assign(:blog_category, blog_category)
  end

  it 'renders the edit blog_category form' do
    render

    assert_select 'form[action=?][method=?]', blog_category_path(blog_category), 'post' do
      assert_select 'input[name=?]', 'blog_category[name]'
    end
  end
end
