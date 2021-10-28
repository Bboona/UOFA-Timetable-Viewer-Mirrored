require 'rails_helper'

RSpec.describe "Teachers", type: :request do
  describe "GET /teachers" do
    it "cannot goto teacher page with no login" do
      get teachers_path
      expect(response).to have_http_status(200)
    end
    it "can goto Teacher page with login" do
      @user = Teacher.new(first_name: "aa",last_name:"bb", password: "123456")
      get teachers_path(@user)
      expect(response).to have_http_status(200)
    end

    it "cannot goto student page with login as Teacher" do
      @user = Teacher.new(first_name: "aa",last_name:"bb", password: "123456")
      get students_path(@user)
      expect(response).to have_http_status(200)
    end

    it "cannot goto admin page with login as Teacher" do
      @user = Teacher.new(first_name: "aa",last_name:"bb", password: "123456")
      get teachers_path(@user)
      expect(response).to have_http_status(200)
    end

    it "cannot goto teacher page after sign out" do
      get teachers_path(@user)
      expect(response).to have_http_status(200)
    end
  end
end
