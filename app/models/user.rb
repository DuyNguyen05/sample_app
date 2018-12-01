class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :name , presence: true , length: {minimum: 3}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true , uniqueness: true , format: {with: VALID_EMAIL_REGEX}

  has_secure_password
  validates :password, length: { minimum: 8 } , presence: true
end
