Given(/^I have an account on the site$/) do
  user = User.create(email: "test@example.com", password: "password", password_confirmation: "password") 
  expect(user).to be_valid
end

Given(/^My account is confirmed$/) do
  user = User.where(email: "test@example.com").first
  user.confirm
  expect(user).to be_confirmed 
end

When(/^I enter my correct email$/) do
  fill_in :user_email, with: 'test@example.com'
end

When(/^I enter my password$/) do
  fill_in :user_password, with: 'password'
end

Then(/^I am redirected to the book index page$/) do
  expect(page).to have_content "Welcome to the bookstore test@example.com"
end

When(/^I enter the wrong password$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am notified that my password is incorrect$/) do
  pending # express the regexp above with the code you wish you had
end
