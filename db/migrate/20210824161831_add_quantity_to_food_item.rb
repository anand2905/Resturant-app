class AddQuantityToFoodItem < ActiveRecord::Migration[6.1]
  def change
    add_column :food_items, :quantity, :integer
  end
end
