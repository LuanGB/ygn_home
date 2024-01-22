# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog::TagsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/blog/tags').to route_to('blog/tags#index')
    end
  end
end
