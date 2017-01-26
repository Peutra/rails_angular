class ProductsController < ApplicationController

  # TODO REFACTO VALID TOKEN (BEFORE_ACTION FOR CREATE/UPDATE/DELETE)

  def index
    render json: {:products => Product.get_all_products}
  end

  def display
  end

  def create
    if @user_data = TokenProvider.valid?(request.headers[:Authorization])
      @user_id = @user_data[0]["user_id"]
      @picture_url = Cloudinary::Uploader.upload(product_params[:picture])['url']
      @new_product = Product.new(product_params.except(:picture).merge(user_id: @user_id, picture_url: @picture_url))
      if @new_product.save
        render json: {:status => 200, :message => "Le produit a bien été créé, have fun"}
      else
        render json: {:status => 400, :message => "Petit souci dans la création du produit"}
      end
    end
  end

  def update
  end

  def delete
  end

  private

  def product_params
    params.permit(:first_name, :last_name, :description, :value, :for_sale, :picture)
  end

end
