class Bid < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def self.get_auto_bids(product_id)
    product_value = Product.current_value(product_id)
    return Bid.where(product_id: product_id, auto: true).where("max_value > ?", product_value).where("end_auto_date > ?", Time.now)
  end
end
