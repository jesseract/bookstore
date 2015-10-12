
Given(/^there are (\d+) books in the database$/) do |amount|
  amount.to_i.times { create(:book) }
end 

When(/^I visit the root url$/) do
  visit('/') 
end

Then(/^I see a list of books in the database$/) do
  expect(page).to have_content(Book.first.title) 
end

Then(/^the books are ordered by published date$/) do
  expect(page).to have_content(Book.first.published_date) 
end

Then(/^the list of (\d+) books are paginated in pages of (\d+) books per page$/) do |total, per_page|
  expect(page).to have_selector("tr", count: per_page.to_i + 1)  
end

Given(/^some books have been ordered$/) do
  create(:book, times_purchased: 1000) 
end

When(/^I sort by "(.*?)"$/) do |sort_by|
  click_link("Sort by #{sort_by}") 
end

Then(/^the books are re\-sorted based on the amount of times they are purchased$/) do
   expect(page).to have_content(1000) 
end

When(/^I enter a book's title into the book search field$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am shown a list of books with that title$/) do
  pending # express the regexp above with the code you wish you had
end
