class User < ApplicationRecord
	has_and_belongs_to_many :resturants
	has_many :orders, dependent: :destroy
end
