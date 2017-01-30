class User < ApplicationRecord
  require 'jwt'
  authenticates_with_sorcery!

  validates :pseudonym, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, on: :create
  validates :email, uniqueness: true, email_format: true

  def self.represent_user_with_token(user)
    ::TokenProvider.issue_token(user_id: user.id, pseudonym: user.pseudonym, email: user.email, credits: user.credits)
  end

  def self.get_user_vote(user_id)
    User.find(user_id).vote
  end

  def self.get_user_credits(user_id)
    User.find(user_id).credits
  end

  def self.decrease_credit(user_id, credits)
    current_credits = User.get_user_credits(user_id)
    User.find(user_id).update(credits: current_credits - credits)
  end

end
