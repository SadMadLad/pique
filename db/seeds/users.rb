User.destroy_all

users_params = 5.times.map do |i|
  { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email_address: "user@#{i}.com", password: "password" }
end

admins_params = 5.times.map do |i|
  { first_name: "Admin", last_name: "Admin", email_address: "admin@#{i}.com", password: "password", role: :admin }
end

User.create(users_params + admins_params)
