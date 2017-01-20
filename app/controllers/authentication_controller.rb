class AuthenticationController < ApplicationController

  respond_to :json

  def register
    new_user = User.new(user_params)
    if new_user.save!
      token = User.represent_user_with_token(new_user)
      new_user.update(token: token)
      render json: {:status => 200, :message => "Merci pour votre inscription !", :token => token}
    else
      render json: {:status => 400, :message => "Petit problème technique"}
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user = User.authenticate(params[:email], params[:password])
      token = User.represent_user_with_token(user)
      user.update(token: token)
      render json: {:status => 200, :message => "Ravis de vous revoir !", :token => token}
    else
      render json: {:status => 400, :message => "Mauvaise combinaison email / mot de passe"}
    end
  end

  def logout
  end

  private

  def user_params
    params.require(:authentication).permit(:pseudonym, :email, :password)
  end


end
