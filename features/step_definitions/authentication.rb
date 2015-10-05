Given(/^I have an account on the site$/) do
  user = User.create(email: "test@example.com", password: "password", password_confirmation: "password") 
  expect(user).to be_valid
end

Given(/^I am logged into the site$/) do
  step "I have an account on the site"
  step "My account is confirmed"
  step "I visit the site root path"
  step "I enter my correct email"
  step "I enter my password"
  step "I click the \"Log in\" button"

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
  expect(page).to have_content "Signed in successfully"
end

When(/^I enter the wrong password$/) do
  fill_in :user_password, with: 'passwrord'
end

Then(/^I am notified that my password is incorrect$/) do
  expect(page).to have_content "Invalid email or password."
end
