user = User.create!(email: "test@example.com", password: "password", password_confirmation: "password") 
user.confirm
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')