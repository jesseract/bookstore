Given(/^I do not have an account on the site$/) do
  user = User.delete_all
end

When(/^I visit the site root path$/) do
  visit '/'
end

Then(/^I am presented with a login page$/) do
  expect(page).to have_content "Log in"
end

When(/^I click the "(.*?)" link$/) do |arg1|
  click_link arg1 
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
  expect(page).to have_content "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account" 
end

Then(/^I am sent a confirmation email$/) do
  email = ActionMailer::Base.deliveries.first
  expect(email.from).to eq(["no-reply@smashingboxes.com"])
  expect(email.to).to eq(["test@example.com"])
  expect(email.body).to have_content("confirm your account") 
end

When(/^I visit the link in that email$/) do
  open_last_email_for("test@example.com")
  visit_in_email("Confirm my account") 
end

Then(/^My email address becomes confirmed$/) do
  expect(page).to have_content "Your email address has been successfully confirmed"
end

When(/^I enter a password with incorrect confirmation$/) do
  fill_in :user_password, with: "password"
  fill_in :user_password_confirmation, with: "passowrd" 
end

Then(/^I am notified that my password confirmation does not match$/) do
  expect(page).to have_content "Sign up 1 error prohibited this user from being saved: Password confirmation doesn't match"
end

When(/^I enter "(.*?)" as my email address$/) do |arg1|
  fill_in :user_email, with: "garbage" 
end

When(/^I enter a password with correct password confirmation$/) do
  fill_in :user_password, with: "password"
  fill_in :user_password_confirmation, with: "password" 
end

Then(/^I am notified that my email address is invalid\.$/) do
  expect(page).to have_content "Sign up 1 error prohibited this user from being saved: Email is invalid" 
end
