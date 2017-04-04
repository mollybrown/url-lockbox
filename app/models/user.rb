class User < ApplicationRecord
  # attr_accessible :email, :password, :password_confirmation
  attr_accessor :password

  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates_confirmation_of :password

  has_secure_password



end


# I cannot sign up with an email address that has already been used.
# I cannot sign up without an email address and a password.
# Password and confirmation must match.
# If criteria is not met the user should be given a message to reflect the reason they could not sign up.
