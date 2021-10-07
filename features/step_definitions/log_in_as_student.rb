Given(/^I am  on the root page$/) do
  visit root_path
end

When(/^I  input the "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

When(/^I  click the button "([^"]*)"$/) do |arg|
  click_button arg
end

Then(/^I  should see "([^"]*)"$/) do |arg|
  expect(page).to have_content(arg)
end