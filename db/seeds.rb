dates = ["2015-10-08", "2015-09-30", "2015-10-01"]
price_cents = [2500, 1900, 2300, 1000, 750]
purchased = [0,1,2,3,4,5,6,7]

100.times { Book.create({title: "That Book", author: "That Girl", 
  published_date: dates.sample, price: Money.new(price_cents.sample), times_purchased: purchased.sample})}

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
user = User.create!(email: "test@example.com", password: "password", password_confirmation: "password") 
user.confirm
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
