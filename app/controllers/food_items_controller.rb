class FoodItemsController < ApplicationController
	# before_action :signed_in_user, only: [:index, :destroy, :create, :new]

  def index
    binding.pry
    resturant = Resturant.find_by(id: params[:resturant_id])
    @food_items = resturant.food_items
  end

  def show
     resturant = Resturant.find_by(id: params[:resturant_id])
    @food_items = resturant.food_items
    @order = Order.new
  end


  def new
    resturant = Resturant.find_by(id: params[:resturant_id])
    @food_items = resturant.food_items.new
  end

  def destroy
    FoodItem.find(params[:id]).destroy
    flash[:success] = "Food Item deleted."
    redirect_to food_items_url
  end

  def create
    @food_item = FoodItem.new(food_item_params)

    if @food_item.save
      flash[:success] = "Food Item \"#{@food_item.title}\" added"
      redirect_to food_items_path
    else
      render 'new'
    end
  end

  private
    def food_item_params
      params.require(:food_item).permit(:title, :description, :picture_url, :price, :active)
    end
end
