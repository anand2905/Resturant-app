class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.integer :quantity, null: false, default: 0
      t.boolean :delivered
      t.float :sub_total, null: false, precision: 15, scale: 2
      t.belongs_to :user
      t.belongs_to :resturant
      

      t.timestamps
    end
  end
end
