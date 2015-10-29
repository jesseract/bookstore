Given(/^there are some books in the database$/) do
  100.times { create(:book) } 
end

When(/^I click on a book$/) do
  click_link(Book.first.title) 
end

When(/^I enter (\d+) for the quantity$/) do |arg1|
  fill_in('line_item_quantity', :with => '1')
end

Then(/^the book is added to my cart$/) do
  expect(page).to have_content(Book.first.title) 
end

When(/^I visit my cart$/) do
  visit('/books') 
  click_link("Your cart")
end

Then(/^I see the book in my cart$/) do
  expect(page).to have_content(Book.first.title) 
end

Then(/^I am asked for my name$/) do
  fill_in('order_name', :with => 'Jessa Test') 
end

Then(/^I am asked for my billing address$/) do
  expect(page).to have_content('Billing address') 
end

When(/^I enter my billing address$/) do
  fill_in('order_billing_address', :with => '123 Test St.')  
end

Then(/^I am asked for my shipping address$/) do
  expect(page).to have_content('Shipping address') 
end

When(/^I enter my shipping address$/) do
  fill_in('order_shipping_address', :with => '123 Test St.') 
end

Then(/^I am asked for my credit card$/) do
  select('Visa', :from => 'order_pay_type')
end

When(/^I enter my credit card$/) do
  fill_in('card_number', :with => '4242424242424242') 
end

When(/^I enter my security code$/) do
  fill_in('card_code', :with => '123') 
end

When(/^I enter the expiration date$/) do
  select('1 - January', :from => 'card_month')
  select('2016', :from => 'card_year') 
end

Then(/^I am asked to review the order total$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am shown the order summary$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^my credit card is saved for future purchases$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am emailed an order invoice containing the books details, quantity, subtotal, and order total$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the book is added to my cart with quantity (\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the book in my cart with quantity (\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I adjust the quantity of the book to (\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^I have a credit card saved on the site$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am asked if I want to use my already saved credit card$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I confirm using my saved credit card$/) do
  pending # express the regexp above with the code you wish you had
end
