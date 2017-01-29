class BidsController < ApplicationController

  def create
    p params
  end

  private

  def bids_params
    # params.permit(:product_id, :user_id, )
  end
end
