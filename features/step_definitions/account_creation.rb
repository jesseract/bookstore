Given(/^I do not have an account on the site$/) do
  user = User.delete_all
end

When(/^I visit the site root path$/) do
  visit '/'
end

Then(/^I am presented with a login page$/) do
  expect(page).to have_content "Log in"
end

When(/^I click "(.*?)"$/) do |arg1|
 click_link('Sign up') 
end

When(/^I click the "(.*?)" button$/) do |arg1|
  click_button arg1
end

When(/^I enter my email address$/) do
 fill_in :user_email, with: 'test@example.com' 
end

When(/^I enter a password with correct confirmation$/) do
 fill_in :user_password, with: "password" 
 fill_in :user_password_confirmation, with: "password"  
end

Then(/^I am told to check my email for a confirmation link$/) do
  expect(page).to have_content "Check your email for a confirmation link." 
end

Then(/^I am sent a confirmation email$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I visit the link in that email$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^My email address becomes confirmed$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter a password with incorrect confirmation$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am notified that my password confirmation does not match$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter "(.*?)" as my email address$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I enter a password with correct password confirmation$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am notified that my email address is invalid\.$/) do
  pending # express the regexp above with the code you wish you had
end
