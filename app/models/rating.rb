class Rating < ApplicationRecord
  belongs_to :user

  def self.product_rate_exists?(user_id, product_id)
    (@rating = Rating.where(user_id: user_id, rateable_id: product_id, rateable_type: "Product").first) ? @rating : nil
  end

  def self.product_average_rate(product_id)
    arr = Rating.where(rateable_type: "Product", rateable_id: product_id).pluck(:value)
    return ((average = arr.inject(0.0) { |sum,el| sum + el } / arr.size) > 0) ? average : 0
  end

end
