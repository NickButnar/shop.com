class ProductsController < ApplicationController
  def index
    @procudcts = Product.all
  end
end
