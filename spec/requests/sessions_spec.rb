require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /LOGIN" do
    it "goto login page with no limit" do
      get login_path
      expect(response).to have_http_status(200)
    end
  end
end
