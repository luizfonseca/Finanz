Given /^I am in the homepage$/ do
  visit root_path
end

When /^I click "(.*?)"$/ do |arg1|
  click_link arg1
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should not see the link "(.*?)"$/ do |arg1|
  page.should_not have_selector "a:contains('#{arg1}')"
end
