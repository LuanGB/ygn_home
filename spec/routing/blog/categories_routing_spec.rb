# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog::CategoriesController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/blog/categories').to route_to('blog/categories#index')
    end
  end
end
