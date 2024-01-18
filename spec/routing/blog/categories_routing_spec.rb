# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog::CategoriesController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/blog/categories').to route_to('blog/categories#index')
    end

    it 'routes to #show' do
      expect(get: '/blog/categories/1').to route_to('blog/categories#show', id: '1')
    end
  end
end
