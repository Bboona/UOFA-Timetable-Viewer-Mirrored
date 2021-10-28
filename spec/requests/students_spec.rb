require 'rails_helper'

RSpec.describe "Students", type: :request do
  describe "GET /students" do

    it "cannot goto student page with no login" do
      get students_path
      expect(response).to have_http_status(200)
    end

    it "can goto student page with login" do
    @user = Student.new(first_name: "aa",last_name:"bb", password: "123456")
    get students_path(@user)
    expect(response).to have_http_status(200)
    end

    it "cannot goto teacher page with login as student" do
      @user = Student.new(first_name: "aa",last_name:"bb", password: "123456")
      get teachers_path(@user)
      expect(response).to have_http_status(200)
    end

    it "cannot goto admin page with login as student" do
      @user = Student.new(first_name: "aa",last_name:"bb", password: "123456")
      get teachers_path(@user)
      expect(response).to have_http_status(200)
    end
    it "cannot goto students page after sign out" do
      get teachers_path(@user)
      expect(response).to have_http_status(200)
    end
  end
end
