class User < ApplicationRecord
  require 'jwt'
  authenticates_with_sorcery!

  validates :pseudonym, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, on: :create
  validates :email, uniqueness: true, email_format: true

  def self.represent_user_with_token(user)
    ::TokenProvider.issue_token(user_id: user.id)
  end

end
