class ProductVarient < ApplicationRecord
  belongs_to :product, optional: true

  validates :price, presence: true
	validates :quantity, presence: true
end
