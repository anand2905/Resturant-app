class Order < ApplicationRecord
	belongs_to :user
	belongs_to :resturant
	has_many :food_items, dependent: :destroy

	accepts_nested_attributes_for :food_items
end
