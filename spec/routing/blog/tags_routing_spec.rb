# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog::TagsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/blog/tags').to route_to('blog/tags#index')
    end

    it 'routes to #show' do
      expect(get: '/blog/tags/1').to route_to('blog/tags#show', id: '1')
    end
  end
end
