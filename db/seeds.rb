100.times do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Name.name,
    published_date: Time.zone.today,
    price: Money.new([2500, 1900, 2300, 1000, 750].sample),
    description: Faker::Lorem.paragraph,
  )
end

user = User.create!(email: "test@example.com", password: "password", password_confirmation: "password")
user.confirm
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
