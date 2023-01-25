# puts "Hello world"
#a = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
#p a

require 'bundler/inline'

gemfile true do 
  source 'http://rubygems.org'
  gem 'bcrypt'
end

require 'bcrypt'

my_password = BCrypt::Password.create("my password")
my_password1 = BCrypt::Password.create("my password")
my_password2 = BCrypt::Password.create("my password")

puts my_password
puts my_password1
puts my_password2

puts my_password == "my password"
# puts "Password string: #{my_password}"

# puts "password: #{my_password}"
# puts my_password.version              #=> "2a"
# puts my_password.cost                 #=> 12
# my_password == "my password"     #=> true
# my_password == "not my password" #=> false

#  my_password = BCrypt::Password.new("$2a$12$LB0MVzack7nWGa8QzKU0MOWpaevq8h2b3AokO1LW6TysPuVpxGPOm")
# puts my_password == "my password"     #=> true
# my_password == "not my password" #=> false

