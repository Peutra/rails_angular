class AuthenticationController < ApplicationController

  private

  # MAYBE THIS SHOULD BE ADDED TO USER MODEL
  def represent_user_with_token(user)
    jsonUser = User.find(user.id).to

  end

end
