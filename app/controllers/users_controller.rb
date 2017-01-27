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

  def rate_product
    @rating = Rating.product_rate_exists?(rate_product_params[:user_id], rate_product_params[:rateable_id])
    p @rating
    if @rating == nil
      @new_rating = Rating.new(rate_product_params.merge(rateable_type: "Product"))
      if @new_rating.save
        render json: {:status => 200, :message => "A noté !", :current_rate => @new_rating}
      else
        render json: {:status => 400, :message => "Mmmmh ça n'a pas fonctionné"}
      end
    else
      @rating.update(value: rate_product_params[:value])
    end
  end

  def credits
    current_credits = User.get_user_credits(credits_params[:user_id].to_i)
    render json: {:status => 200, :message => "Number of credits", :current_credits => current_credits}
  end

  private

  def vote_params
    params.permit(:user_id, :product_id)
  end

  def current_vote_params
    params.permit(:user_id)
  end

  def rate_product_params
    params.permit(:user_id, :rateable_id, :value)
  end

  def credits_params
    params.permit(:user_id)
  end

end
