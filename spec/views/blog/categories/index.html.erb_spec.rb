# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blog/categories/index' do
  before do
    assign(:blog_categories, [Blog::Category.create!(name: 'Name'), Blog::Category.create!(name: 'Name')])
  end

  xit 'renders a list of blog/categories' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end
