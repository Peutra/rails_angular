class AuthenticationController < ApplicationController

  respond_to :json

  def register
    @new_user = User.new(user_params)
    if @new_user.save!
      p User.represent_user_with_token(@new_user)
      render status: 200, message: "User saved"
    else
      render status: 400, message: "Something went wrong"
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
