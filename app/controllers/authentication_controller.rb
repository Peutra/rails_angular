class AuthenticationController < ApplicationController

  respond_to :json

  def register
    @new_user = User.new(user_params)
    token = User.represent_user_with_token(@new_user)
    @new_user.token = token
    if @new_user.save!
      render json: {:status => 200, :message => "Merci pour votre inscription !", :token => token}      
    else
      render json: {:status => 400, :message => "Petit problème technique"}
    end
  end

  def login
  end

  def logout
  end

  private

  def user_params
    params.require(:authentication).permit(:pseudonym, :email, :password)
  end


end
