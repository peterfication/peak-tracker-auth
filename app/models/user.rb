# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

##
# A user is a person who can log in to the application.
class User < ApplicationRecord
  devise(
    :confirmable,
    :database_authenticatable,
    :lockable,
    # :omniauthable
    :recoverable,
    :registerable,
    :rememberable,
    :timeoutable,
    :trackable,
    :validatable,
  )

  validates :sign_in_count, :failed_attempts, :encrypted_password, presence: true
  validates :admin, inclusion: { in: [true, false] }

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  # Set up attributes so Devise trackable does not complain
  # that we don't have these fields in the database.
  attr_accessor :current_sign_in_ip, :last_sign_in_ip

  # rubocop:disable Rails/InverseOf
  has_many(
    :access_grants,
    class_name: "Doorkeeper::AccessGrant",
    foreign_key: :resource_owner_id,
    dependent: :destroy,
  )

  has_many(
    :access_tokens,
    class_name: "Doorkeeper::AccessToken",
    foreign_key: :resource_owner_id,
    dependent: :delete_all,
  )
  # rubocop:enable Rails/InverseOf
end
