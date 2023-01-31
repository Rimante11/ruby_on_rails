class User < ApplicationRecord
  validates :username, presence: true, 
            uniqueness: { case_sensetive: false }, length: { minimum: 3, maximum: 25 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
            uniqueness: { case_sensetive: false },  length: { maximum: 105 },
            format: {with: VALID_EMAIL_REGEX } 
end

# uniqueness: { case_sensetive: false }, för uniq username, även bokstaver Aaa=aaa
