class FoodItem < ApplicationRecord
	belongs_to :order
	belongs_to :resturant
end
