class Profile::OrdersController < ApplicationController
  before_action :require_reguser

  def index
    @user = current_user
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_address = @order.address
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.user == current_user
      @order.order_items.where(fulfilled: true).each do |oi|
        item = Item.find(oi.item_id)
        item.inventory += oi.quantity
        item.save
        oi.fulfilled = false
        oi.save
      end

      @order.status = :cancelled
      @order.save

      redirect_to profile_orders_path
    else
      render file: 'public/404', status: 404
    end
  end

  def create
    address = Address.find(params[:address])
    order = Order.create(user: current_user, status: :pending, address: address)
    cart.items.each do |item, quantity|
      order.order_items.create(item: item, quantity: quantity, price: item.price)
    end
    session.delete(:cart)
    flash[:success] = "Your order has been created!"
    redirect_to profile_orders_path
  end

  def new_address
    @order = Order.find(params[:id])
    @order_address = @order.address
  end

  def update_address
    @order = Order.find(params[:id])
    @order.user.addresses << Address.create(address_params)
    @order.update(address: Address.last)
    @order.save
    flash[:success] = "Your shipping address has been updated."
    redirect_to profile_order_path(@order)
  end

  private

  def address_params
    params.require(:address).permit(:name, :street, :city, :state, :zip)
  end
end
