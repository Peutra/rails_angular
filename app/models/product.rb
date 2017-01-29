class Product < ApplicationRecord
  belongs_to :user

  # MAYBE ATTR ACCESORS WOULD BE NICER TO RETRIEVE VALUES (TRY IT OUT SOME TIME)

  def self.get_all_products
    tmp_products = []
    Product.all.each do |product|
      tmp_product = product.as_json
      tmp_product[:average] = Rating.product_average_rate(product.id)
      tmp_products << tmp_product
    end
    return tmp_products
  end

  def self.current_value(product_id)
    Product.find(product_id).value
  end

  def self.update_value(product_id, value)
    product = Product.find(product_id)
    if product.for_sale
      product.update(value: value)      
    end
  end

  def self.max_value(product_id)
    Product.find(product_id).max_value
  end

end
