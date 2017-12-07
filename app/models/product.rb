class Product < ApplicationRecord
  has_many :product_varients, dependent: :destroy

  accepts_nested_attributes_for :product_varients, allow_destroy: true

  validates :name, presence: true
	validates :code, presence: true
end
