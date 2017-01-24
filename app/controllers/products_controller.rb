class ProductsController < ApplicationController

  # TODO REFACTO VALID TOKEN (BEFORE_ACTION FOR CREATE/UPDATE/DELETE)

  def index
    render json: {:products => Product.all}
  end

  def display
  end

  def create
    p params
    if @user_data = TokenProvider.valid?(request.headers[:Authorization])
      @user_id = @user_data[0]["user_id"]
      @new_product = Product.new(product_params.merge(user_id: @user_id))
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
    params.require(:product).permit(:first_name, :last_name, :description, :value, :for_sale, :file)
  end

end
