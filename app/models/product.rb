class Product < ApplicationRecord
  belongs_to :user

  def self.get_all_products
    tmp_products = []
    Product.all.each do |product|
      tmp_product = product.as_json
      tmp_product[:average] = Rating.product_average_rate(product.id)
      tmp_products << tmp_product
    end
    return tmp_products
  end

end
