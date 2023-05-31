# frozen_string_literal: true

class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = 'Product has been successfully created'
      redirect_to product_path(@product.id)
    else
      flash[:error] = 'Creation error'
    end
  end

  def edit
    @product = Product.find_by id: params[:id]
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = 'Product has been successfully updated'
      redirect_to product_path(@product.id)
    else
      flash[:error] = 'Updating error'
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :in_stock, :price)
  end
end
