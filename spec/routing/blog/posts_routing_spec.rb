# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog::PostsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/blog/posts').to route_to('blog/posts#index')
    end

    it 'routes to #show' do
      expect(get: '/blog/posts/1').to route_to('blog/posts#show', id: '1')
    end
  end
end
