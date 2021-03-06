class BidsController < ApplicationController

  def create
    current_user_credits = User.get_user_credits(bid_params[:user_id])
    current_product_value = Product.current_value(bid_params[:product_id])
    current_product_max_value = Product.max_value(bid_params[:product_id])
    current_auto_bids = Bid.get_auto_bids(bid_params[:product_id])
    current_user_active_bids_value = Bid.get_current_user_active_bids_value(bid_params[:user_id])

    # 0.0 CHECK IF USER HAS ENOUGH CREDITS IF NOT STOP & RENDER JSON
    if current_user_credits < (bid_params[:start_value] + current_user_active_bids_value)
      render json: {:status => 400, :message => "Vous êtes trop pauvre en crédits."}
      return
    end
    # 0.1 CHECK IF BID'S START VALUE IS SUPERIOR TO CURRENT PRODUCT'S VALUE
    if current_product_value > bid_params[:start_value]
      render json: {:status => 400, :message => "La valeur du produit est déjà supérieure à celle que tu viens de rentrer."}
      return
    end
    # IF AUTO >>
      # 0.2 CHECK IF BID'S START VALUE + INCREMENT < USER'S CREDIT THEN AUTO (WILL NOT BE ABLE TO INCREMENT SO AUTO = FALSE)
      # 0.3 CHECK IF AUTO IS CHECKED THEN VALUE = START_VALUE
    if bid_params[:auto] === true
      p bid_params[:auto]
      if (current_user_credits < bid_params[:start_value] + bid_params[:increment_by])
          bid_params[:auto] = false
      end
      if bid_params[:start_value]
        bid_params.merge(value: bid_params[:start_value])
      end
    end
    # 0.3 CHECK IF BID'S START VALUE IS EQUAL OR SUPERIOR TO PRODUCT'S MAX VALUE (IF YES STOP)
    if current_product_max_value != nil && bid_params[:start_value] >= current_product_max_value
      # 1. CREATE BID
      save_bid(bid_params)
      return
      # 2. SET PRODUCT'S FOR_SALE TO FALSE
      # 3. SET PRODUCT'S OWNER TO CURRENT USER
      # 4. SAY BRAVO
    end
    save_bid(bid_params)
    return
    # 3. RETURN BIDS HISTORY AND CURRENT VALUE (MAX BID ON CURRENT BID)
  end

  def save_bid(bid)
    @new_bid = Bid.new(bid.merge(value: bid_params[:start_value]))
    if @new_bid.save
      # USE NEXT LINE TO DECREASE CREDIT ON WIN
      # User.decrease_credit(bid_params[:user_id], bid_params[:start_value])
      Product.update_value(bid[:product_id], bid[:start_value])
      # SET TO NON ACTIVE ALL OTHER BIDS
      Bid.set_non_active_losing_bids(bid[:product_id], @new_bid.id)
      Bid.run_auto_bids(bid[:product_id], @new_bid.value)
      updated_bids = Bid.get_bids(bid[:product_id])
      product_new_value = Product.find(bid[:product_id]).value
      render json: {:status => 200, :message => "Merci pour votre enchère.", :new_bids => updated_bids, :new_product_value => product_new_value}
    else
      render json: {:status => 400, :message => "Impossible de placer cette enchère, svp reessayez."}
    end
  end

  # TODO TODO TODO TODO TODO TODO TODO
  # CHANGE PRODUCT USER'S OWNER IF
      #  1. ... BIDS VALUE EQUALS OR SUPERIOR TO PRODUCT MAX VALUE
        # 1.0 CHANGE BATCH SET PRODUCT FOR_SALE TO FALSE AND ADD BATCH NUMBER FOR DISPLAYING CURRENT BID BATCH
      #  2. ... AUTO MAX VALUE EQUALS OR SUPERIOR TO PRODUCT MAX VALUE THEN BUY THEN BACK TO 1.
      #  3. ... END DATE OF BIDS MAKE THE HIGHEST BID WIN

  private

  def bid_params
    params.require(:bid).permit(:product_id, :user_id, :start_value, :auto,
                                :end_auto_date, :increment_by, :max_value)
  end
end
