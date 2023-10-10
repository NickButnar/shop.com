# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.boolean :in_stock
      t.decimal :price

      t.timestamps
    end
  end
end
