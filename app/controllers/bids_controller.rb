class BidsController < ApplicationController

  def create
    p bids_params
  end

  private

  def bids_params
    params.require(:bid).permit(:product_id, :user_id, :start_value, :auto, :end_auto_date, :increment_by,
                                :max_value)
  end
end
