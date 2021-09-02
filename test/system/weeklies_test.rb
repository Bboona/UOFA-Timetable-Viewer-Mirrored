require "application_system_test_case"

class WeekliesTest < ApplicationSystemTestCase
  setup do
    @weekly = weeklies(:one)
  end

  test "visiting the index" do
    visit weeklies_url
    assert_selector "h1", text: "Weeklies"
  end

  test "creating a Weekly" do
    visit weeklies_url
    click_on "New Weekly"

    fill_in "Week", with: @weekly.week
    click_on "Create Weekly"

    assert_text "Weekly was successfully created"
    click_on "Back"
  end

  test "updating a Weekly" do
    visit weeklies_url
    click_on "Edit", match: :first

    fill_in "Week", with: @weekly.week
    click_on "Update Weekly"

    assert_text "Weekly was successfully updated"
    click_on "Back"
  end

  test "destroying a Weekly" do
    visit weeklies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Weekly was successfully destroyed"
  end
end
