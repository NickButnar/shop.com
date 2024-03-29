# frozen_string_literal: true

class ChangePricePrecisionInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :price, :decimal, precision: 10, scale: 2
  end
end
