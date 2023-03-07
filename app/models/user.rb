##
# A user is a person who can log in to the application.
class User < ApplicationRecord
  devise(
    :confirmable,
    :database_authenticatable,
    # :lockable,
    # :omniauthable
    :recoverable,
    :registerable,
    :rememberable,
    :timeoutable,
    :trackable,
    :validatable,
  )

  # Set up attributes so Devise trackable does not complain
  # that we don't have these fields in the database.
  attr_accessor :current_sign_in_ip, :last_sign_in_ip
end
