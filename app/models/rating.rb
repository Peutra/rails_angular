class Rating < ApplicationRecord
  belongs_to :user

  def self.product_rate_exists?(user_id, product_id)
    (@rating = Rating.where(user_id: user_id, rateable_id: product_id, rateable_type: "Product").first) ? @rating : nil
  end

end
