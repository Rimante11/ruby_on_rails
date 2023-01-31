class User < ApplicationRecord
  #upper letter or small letter saving
  before_save { self.email = email.downcase }
  has_many :articles
  validates :username, presence: true, 
            uniqueness: { case_sensetive: false }, length: { minimum: 3, maximum: 25 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
            uniqueness: { case_sensetive: false },  length: { maximum: 105 },
            format: {with: VALID_EMAIL_REGEX } 
  has_secure_password
end

# uniqueness: { case_sensetive: false }, för uniq username, även bokstaver Aaa=aaa
