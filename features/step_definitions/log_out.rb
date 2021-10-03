Given(/^I am  on the admin page$/) do
  visit admin_path
end

When(/^I  click the button "([^"]*)"$/) do |arg|
  click_button arg
end

Then(/^I  should in root page$/) do
  expect(page).to have_content(arg)
end