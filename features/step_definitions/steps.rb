Given /^I am in the homepage$/ do
  visit root_path
end

Given /^I am logged in$/ do
  visit '/auth/facebook'
  @current_user = User.find_by_email("nicolas@engage.is")
end

Given /^I attach a file with 83 transactions into the form$/ do
  attach_file "import[file]", "#{Rails.root}/features/support/financial.csv"
end

Given /^I have (\d+) of (incoming|outgoing) (last month|this month)$/ do |arg1, arg2, arg3|
  value = arg2 == "incoming" ? arg1.to_f : (arg1.to_f * -1)
  date = arg3 == "last month" ? (Time.now - 1.month) : Time.now
  Transaction.make! :import => Import.make(:user => @current_user), :value => value, :date => date, :description => "My transaction"
end

When /^I go to "(.*?)"$/ do |arg1|
  case arg1
  when "the homepage"
    visit root_path
  else
    raise "I don't know #{arg1}"
  end
end

When /^I click "(.*?)"$/ do |arg1|
  click_link arg1
end

When /^I press "(.*?)"$/ do |arg1|
  click_button arg1
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should see "(.*?)" of incoming$/ do |arg1|
  page.should have_css(".brief_summary .incoming span:contains('#{arg1}')")
end

Then /^I should see "(.*?)" of outgoing$/ do |arg1|
  page.should have_css(".brief_summary .outgoing span:contains('#{arg1}')")
end

Then /^I should not see the link "(.*?)"$/ do |arg1|
  page.should_not have_selector "a:contains('#{arg1}')"
end

Then /^I should be in "(.*?)"$/ do |arg1|
  if arg1 == "the transactions page"
    current_path.should be_== transactions_path
  else
    raise "I don't know #{arg1}"
  end
end
