require_relative 'crud'

#same ass above, men om det är inte i samma directory
# $LOAD_PATH << "."
# require 'crud'

users = [
  { username: "adele", password: "password1"},
  { username: "jack", password: "password2"},
  { username: "arya", password: "password3"},
  { username: "jonshow", password: "password4"},
  { username: "heisenberg", password: "password5"}
]

hashed_users = Crud.create_secure_users(users)

puts "PRINTING HASHED USERS #{hashed_users}"