class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :pseudonym, presence: true, uniqueness: true
  validates :role, presence: true
  validates :password, length: { minimum: 6 }, on: :create
  validates :email, uniqueness: true, email_format: true
end
