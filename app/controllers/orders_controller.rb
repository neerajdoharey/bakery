class OrdersController < ApplicationController
  def index
    @orders = ActiveRecord::Base.connection.execute("SELECT orders.id, orders.created_at, customers.name, customers.address FROM orders INNER JOIN customers ON orders.customer_id=customers.id ORDER BY orders.created_at DESC;")

  end

  def new
    @order = Order.new
    @order.order_line_items.build
  end

  def create
    @order = Order.new(product_params)

    if @order.contains_valid_line_items?
      if @order.save
        puts "Error message : #{@order.errors.full_messages}"
        flash[:success] = "Order Successfully created..."
        redirect_to orders_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def show
    @order = Order.find(order_id = params[:id])
    @customer = @order.customer
    @order_line_items = @order.order_line_items
  end

  private
  def product_params
    params.require(:order).permit(:customer_id, order_line_items_attributes: ProductVarient.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
