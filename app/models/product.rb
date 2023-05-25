class Product < ApplicationRecord
  validates :title, :description, :in_stock, :price, precence: true
end
