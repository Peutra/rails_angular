class AuthenticationController < ApplicationController

  respond_to :json

  def register    
    @new_user = User.new(user_params)
    if @new_user.save

    else

    end
  end

  def login
  end

  private

  def user_params
    params.require(:authentication).permit(:pseudonym, :email, :password)
  end

  # MAYBE THIS SHOULD BE ADDED TO USER MODEL
  # TODO >> https://adrianperez.org/json-web-tokens-with-rails-sorcery-and-angularjs/
  def represent_user_with_token(user)

  end

end
