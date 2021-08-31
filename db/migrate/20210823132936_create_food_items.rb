class CreateFoodItems < ActiveRecord::Migration[6.1]
  def change
    create_table :food_items do |t|
      t.string :destription
      t.float :price, null: false, precision: 15, scale: 2
      t.string :title
      t.belongs_to :order
      t.belongs_to :resturant

      t.timestamps
    end
  end
end
