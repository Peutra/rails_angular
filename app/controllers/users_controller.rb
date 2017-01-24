class UsersController < ApplicationController

  def vote
    if (user = User.find(vote_params[:user_id])) && Product.find(vote_params[:product_id])
      user.update(vote: vote_params[:product_id])
    end
  end

  private

  def vote_params
    params.permit(:user_id, :product_id)
  end

end
