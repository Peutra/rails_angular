class Bid < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def self.get_auto_bids(product_id)
    product_value = Product.current_value(product_id)
    return Bid.where(product_id: product_id, auto: true).where("max_value > ?", product_value).where("end_auto_date > ?", Time.now)
  end

  def self.get_bids(product_id)
    return Bid.where(product_id: product_id)
  end

  def self.get_current_user_active_bids_value(user_id)
    bids = Bid.where(user_id: user_id, active: true).pluck(:value)
    return bids.inject(0){|sum,x| sum + x }
  end

  def self.set_non_active_losing_bids(product_id, current_winning_bid_id)
    losing_bids = Bid.where(product_id: product_id).where.not(id: current_winning_bid_id)
    losing_bids.each do |bid|
      bid.update(active: false)
    end
  end

end
