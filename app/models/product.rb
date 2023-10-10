# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image
  has_rich_text :description

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end
