class OrderLineItem < ApplicationRecord
	belongs_to :order
  belongs_to :product
  has_many :order_line_item_histories, autosave: true, dependent: :destroy

  def generate_order_item_logs

  	return if product.nil?
  	varients = product.product_varients.map(&:quantity).sort!.reverse

  	varient_quantities = Hash.new(0)

    make_change(quantity, varients).each do |i|
      varient_quantities[i] += 1
    end

    product.product_varients.order("quantity DESC").each do |varient|
      params = {
        product_varient_id: varient.id,
        quantity: varient_quantities[varient.quantity],
        price: varient.price
      }

      order_line_item_histories << OrderLineItemHistory.new(params) if varient_quantities[varient.quantity] > 0
    end    

    if varient_quantities.empty?
      order.errors.add(:quantity, "needs to fit packs")
      false
    else
      true
    end
  end

  private

  def make_change(a, list )
    return [] if a < 0
    return [] if a != a.floor

    parents = Array.new(a + 1)
    parents[0] = 0
    worklist = [[0, 0]]
    while parents[a].nil? && !worklist.empty? do
      base, starting_index = worklist.shift
      starting_index.upto(list.size - 1) do |index|
        denomination = list[index]
        tot = base + denomination
        if tot <= a && parents[tot].nil?
          parents[tot] = base
          worklist << [tot, index]
        end
      end
    end

    return [] if parents[a].nil?
    result = []
    while a > 0 do
      parent = parents[a]
      result << a - parent
      a = parent
    end
    result.sort!.reverse!
  end
end
