class Dashboard::DashboardController < Dashboard::BaseController
  def index
    @merchant = current_user
    @pending_orders = Order.pending_orders_for_merchant(current_user.id)
    @items_with_placeholder_image = @merchant.items_with_placeholder_image
    @unfulfilled_orders_count = @merchant.unfulfilled_orders_count
    @unfulfilled_orders_revenue = @merchant.unfulfilled_orders_revenue
  end
end
