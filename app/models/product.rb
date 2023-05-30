class Product < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :in_stock, presence: true
  validates :price, presence: true, length: { minimum: 1 }
end
