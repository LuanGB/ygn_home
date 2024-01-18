# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blog/tags/index' do
  before do
    assign(:blog_tags, [Blog::Tag.create!(name: 'Name'), Blog::Tag.create!(name: 'Name')])
  end

  xit 'renders a list of blog/tags' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end
