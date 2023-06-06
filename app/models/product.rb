class Product < ApplicationRecord

  has_one_attached :image

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end
