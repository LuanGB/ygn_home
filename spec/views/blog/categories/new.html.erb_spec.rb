# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blog/categories/new' do
  before do
    assign(:blog_category, Blog::Category.new(name: 'MyString'))
  end

  it 'renders new blog_category form' do
    render

    assert_select 'form[action=?][method=?]', blog_categories_path, 'post' do
      assert_select 'input[name=?]', 'blog_category[name]'
    end
  end
end
