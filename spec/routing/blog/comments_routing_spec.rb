# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog::CommentsController do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/blog/comments').to route_to('blog/comments#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/blog/comments/1').to route_to('blog/comments#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/blog/comments/1').to route_to('blog/comments#update', id: '1')
    end
  end
end
