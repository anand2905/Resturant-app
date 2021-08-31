class CreateJoinTableResturantsUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :resturants, :users do |t|
       t.index [:resturant_id, :user_id]
       t.index [:user_id, :resturant_id]
    end
  end
end
