require 'rails_helper'

RSpec.describe "Sites", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/site/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /contact" do
    it "returns http success" do
      get "/site/contact"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /terms" do
    it "returns http success" do
      get "/site/terms"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /privacy" do
    it "returns http success" do
      get "/site/privacy"
      expect(response).to have_http_status(:success)
    end
  end

end
