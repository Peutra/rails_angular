class UsersController < ApplicationController

  def vote
    if (user = User.find(vote_params[:user_id])) && Product.find(vote_params[:product_id])
      user.update(vote: vote_params[:product_id])
    end
  end

  def current_vote
    current_vote = User.get_user_vote(current_vote_params[:user_id].to_i)
    render json: {:status => 200, :message => "A voté !", :current_vote => current_vote}
  end

  private

  def vote_params
    params.permit(:user_id, :product_id)
  end

  def current_vote_params
    params.permit(:user_id)
  end

end
