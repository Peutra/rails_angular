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

  def self.run_auto_bids(product_id, current_value)
    current_date = Time.now
    product = Product.find(product_id)
    auto_bids = Bid.get_auto_bids(product_id)
    valid_auto_bids = []
    auto_bids.each do |auto_bid|
      if ((auto_bid.max_value + auto_bid.increment_by > current_value) && (auto_bid.end_auto_date > current_date))
        valid_auto_bids << auto_bid
      end
    end
    # SEPERATE CASE WHERE ONE AUTO_BID (> SET AUTOMATICALLY VALUE TO CURRENT VALUE + INCREMENT)
    # FOR THE REST OF THE CASES, CHECK THE TWO HIGHEST MAX VALUES AND SET THE MAXMAX VALUE TO THE
    # SECOND MAXMAX VALUE PLUS INCREMENT OF THE SECOND ONE
    if valid_auto_bids.length === 1
      increment = valid_auto_bids[0].increment_by
      valid_auto_bids[0].update(value: current_value + increment)
      product.update(value: current_value + increment)
      Bid.set_non_active_losing_bids(product_id, valid_auto_bids[0].value)
    elsif valid_auto_bids.length > 1
      result = valid_auto_bids.sort_by{|e| -e[:max_value]}
      max_value_second_max = result[1].max_value
      increment_value_first_max = result[0].increment_by
      result[1].update(value: max_value_second_max)
      result[0].update(value: (max_value_second_max + increment_value_first_max))
      product.update(value: (max_value_second_max + increment_value_first_max))
      Bid.set_non_active_losing_bids(product_id, result[0].id)
    end
  end

end
