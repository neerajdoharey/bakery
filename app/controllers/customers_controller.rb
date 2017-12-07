class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(category_params)
    if @customer.save
      flash[:success] = "Successfully created..."
      redirect_to customers_path
    else
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(category_params)
      flash[:success] = "Customer was Successfully updated..."
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private
  def category_params
    params.require(:customer).permit(:name,:address)
  end
end
