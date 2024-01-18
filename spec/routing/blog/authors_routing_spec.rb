# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog::AuthorsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/blog/authors').to route_to('blog/authors#index')
    end

    it 'routes to #show' do
      expect(get: '/blog/authors/1').to route_to('blog/authors#show', id: '1')
    end
  end
end
