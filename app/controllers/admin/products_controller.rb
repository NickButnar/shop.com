# frozen_string_literal: true

class Admin::ProductsController < ApplicationController
  def index
    products = Product.all
    render locals: { products: products }
  end

  def new
    product = Product.new
    render locals: { product: product }
  end

  def create
    product = Product.new(product_params)

    if product.save
      flash[:success] = 'Product has been successfully created'
      redirect_to admin_products_url
    else
      flash[:error] = 'Creation error'
      render :new, locals: { product: product }
    end
  end

  def edit
    product = Product.find(params[:id])
    render locals: { product: product }
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      flash[:success] = 'Product has been successfully updated'
      redirect_to admin_products_url
    else
      flash[:error] = 'Updating error'
      render :edit, locals: { product: product }
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admin_products_url
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :in_stock, :price, :image)
  end
end
