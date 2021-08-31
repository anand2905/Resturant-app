class ResturantsController < ApplicationController

	def index
		@resturants = Resturant.all
	end

  def show
    @resturant = Resturant.find(params[:id])
  end

  def new
    @resturant = Resturant.new
  end

  def create
    @resturant = Resturant.new(title: "...", body: "...")

    if @resturant.save
      redirect_to @resturant
    else
      render :new
    end
  end
end
