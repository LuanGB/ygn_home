# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blog/authors/show' do
  before do
    assign(:blog_author,
           Blog::Author.create!(name: 'Name', bio: 'Bio',
                                avatar: File.open(Rails.root.join('spec', 'fixtures', 'image.jpg'))))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Bio/)
  end
end
