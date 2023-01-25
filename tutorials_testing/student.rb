require_relative 'crud'

class Student
  #includerar module Crud
  include Crud
  attr_accessor :first_name, :last_name, :email, :uersname, :password

  def initialize(firstname, lastname, username, email, password)
    @first_name = firstname
    @last_name = lastname
    @username = username
    @email = email
    @password = password
  end

  def to_s
    "First name: #{@first_name}, Last name: #{@last_name}, Username: #{@username}, Email: #{@email}"
  end

end

adele = Student.new("Adele", "Panele", "adele1", "adele@example.com", "password1")

jack = Student.new("John", "Doe", "john1", "john@example.com", "password2")

hashed_password = adele.create_hash_digest(adele.password)

puts hashed_password