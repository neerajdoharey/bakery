class Order < ApplicationRecord
	belongs_to :customer
  has_many :order_line_items, dependent: :destroy
  has_many :order_line_item_histories, through: :order_line_items

  accepts_nested_attributes_for :order_line_items, allow_destroy: true

  def contains_valid_line_items?
  	not order_line_items.map do |i|
       i.generate_order_item_logs 
    end.include? false
  end
end
