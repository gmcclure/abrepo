Given(/^I go to the home page$/) do
  visit "/"
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content arg1
end
