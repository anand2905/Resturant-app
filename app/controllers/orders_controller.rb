class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
  	@order = Order.new
  end

  def create
    binding.pry
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to user_path(@current_user)
    else
      # Try to redirect him back to the Add Order page if we have a food_item_id
      if @order.food_item_id != nil
        @food_item = FoodItem.find(@order.food_item_id)
        render :template => "food_items/show"
      else
        redirect_to user_path(@current_user)
      end
    end
  end


  def destroy
    if @order.paid || @order.delivered
      flash[:error] = "You cannot delete an order you've paid for!"
    else
      @order.destroy
    end
    route_selector
  end

  def cancellation
    @order = get_pending_order
    @food_item = @order == nil ? nil : FoodItem.find(@order.food_item_id)
  end


  private

    def order_params
      params.require(:order).permit(
        :name, :address, :title, :price, :destription, :quantity, :resturant_food_ids
      )
    end

end
