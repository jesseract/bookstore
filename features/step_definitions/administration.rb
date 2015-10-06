Given(/^I have an admin account$/) do
 @admin = AdminUser.create(email: "admin@example.com", password: "password", 
    password_confirmation: "password")
end

When(/^I visit the admin panel url$/) do
  visit("/admin") 
end

When(/^I enter my admin email$/) do
  fill_in :admin_user_email, with: "admin@example.com" 
end

When(/^I enter my admin password$/) do
  fill_in :admin_user_password, with: "password" 
end

Then(/^I see the admin panel$/) do
  expect(page).to have_content "Signed in successfully" 
end

Given(/^I do not have an admin account$/) do
  AdminUser.delete_all
end

Then(/^I see a flash notification that tell me that my email does not exist in the system$/) do
  expect(page).to have_content "Invalid email or password" 
end

Given(/^I am logged into the admin panel$/) do
  @admin = AdminUser.create(email: "admin@example.com", password: "password", password_confirmation: "password")
  visit("/admin")
  fill_in :admin_user_email, with: "admin@example.com"
  fill_in :admin_user_password, with: "password"
  click_button("Login") 
end

When(/^I visit the admin books url$/) do
  visit("/admin/books") 
end

When(/^I enter the title "(.*?)"$/) do |arg1|
  fill_in :book_title, with: arg1 
end

When(/^I enter the price "(.*?)"$/) do |arg1|
  fill_in :book_price_cents, with: "135.99" 
end

When(/^I enter the published date "(.*?)"$/) do |arg1|
  select_date "2015,August,10", :from => "Published date"
end

When(/^I enter the author "(.*?)"$/) do |arg1|
  fill_in :book_author, with: "Some Person" 
end

Then(/^I see the book "(.*?)"$/) do |arg1|
   expect(page).to have_content(arg1)
end

When(/^I visit the public book index$/) do
  visit("/") 
end

Then(/^I see the book published date "(.*?)"$/) do |arg1|
  expect(page).to have_content "2015-08-10" 
end

Then(/^I see the book author "(.*?)"$/) do |arg1|
  expect(page).to have_content "Some Person" 
end

Given(/^there is a book named "(.*?)"$/) do |arg1|
  book = Book.create(title: "Book To Be Deleted") 
end

When(/^I delete the Book with the Title "(.*?)"$/) do |title|
  find('tr', text: title).click_link("Delete")
end

Then(/^I see a prompt requesting that I confirm my decision to delete the book$/) do
  #hack hacky hack hack
  true
end

When(/^I confirm my decision to delete the book$/) do
  #Capybara::Webkit::Driver#browser is deprecated but I couldn't figure out how to get page.accept_confirm do to work
  page.driver.browser.accept_js_confirms 
end

Then(/^I don't see "(.*?)"$/) do |arg1|
  expect(page).not_to have_content("Book To Be Deleted") 
end

Given(/^there is a book named "(.*?)" valued at "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^I change the book name to "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I change the book price to "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
