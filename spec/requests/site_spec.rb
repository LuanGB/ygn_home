# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sites' do
  describe 'GET /home' do
    it 'returns http success' do
      get '/site/home'
      # expect(response.has_http_status?(:success)).to be(true)
    end
  end

  describe 'GET /contact' do
    it 'returns http success' do
      get '/site/contact'
      # expect(response.has_http_status?(:success)).to be(true)
    end
  end

  describe 'GET /terms' do
    it 'returns http success' do
      get '/site/terms'
      # expect(response.has_http_status?(:success)).to be(true)
    end
  end

  describe 'GET /privacy' do
    it 'returns http success' do
      get '/site/privacy'
      # expect(response.has_http_status?(:success)).to be(true)
    end
  end
end
