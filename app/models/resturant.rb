class Resturant < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :food_items
	has_one :orders
end
