class OrderLineItemHistory < ApplicationRecord
	belongs_to :order_line_item, dependent: :destroy
  belongs_to :product_varient
  has_one :product, through: :product_varient
end
