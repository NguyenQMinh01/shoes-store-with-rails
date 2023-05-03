class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end

  def show
  end
end
