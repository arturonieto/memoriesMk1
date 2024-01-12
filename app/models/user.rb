class User < ApplicationRecord
  has_secure_password
  validates :username, precense: true, uniqueness: true
  validates :email, precense: true, uniqueness: true
end
