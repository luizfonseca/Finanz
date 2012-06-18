Given /^I am in the homepage$/ do
  visit root_path
end

Given /^I am logged in$/ do
  visit '/auth/facebook'
end

Given /^I attach a file with 83 transactions into the form$/ do
  attach_file "import[file]", "#{Rails.root}/features/support/financial.csv"
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

When /^I press "(.*?)"$/ do |arg1|
  click_button arg1
end

Then /^I should be in "(.*?)"$/ do |arg1|
  if arg1 == "this import page"
    current_path.should be_== import_path(Import.first)
  elsif
    current_path.should be_== transactions_path
  else
    raise "I don't know #{arg1}"
  end
end
