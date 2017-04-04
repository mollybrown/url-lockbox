class User < ApplicationRecord
  attr_accessor :password

  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates_confirmation_of :password

  has_secure_password

  has_many :links

end
