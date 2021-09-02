require "test_helper"

class WeekliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weekly = weeklies(:one)
  end

  test "should get index" do
    get weeklies_url
    assert_response :success
  end

  test "should get new" do
    get new_weekly_url
    assert_response :success
  end

  test "should create weekly" do
    assert_difference('Weekly.count') do
      post weeklies_url, params: { weekly: { week: @weekly.week } }
    end

    assert_redirected_to weekly_url(Weekly.last)
  end

  test "should show weekly" do
    get weekly_url(@weekly)
    assert_response :success
  end

  test "should get edit" do
    get edit_weekly_url(@weekly)
    assert_response :success
  end

  test "should update weekly" do
    patch weekly_url(@weekly), params: { weekly: { week: @weekly.week } }
    assert_redirected_to weekly_url(@weekly)
  end

  test "should destroy weekly" do
    assert_difference('Weekly.count', -1) do
      delete weekly_url(@weekly)
    end

    assert_redirected_to weeklies_url
  end
end
