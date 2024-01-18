# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blog/authors/index' do
  before do
    assign(:blog_authors, [Blog::Author.create!(name: 'Name', bio: 'Bio'), Blog::Author.create!(name: 'Name', bio: 'Bio')])
  end

  xit 'renders a list of blog/authors' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Bio'.to_s), count: 2
  end
end
