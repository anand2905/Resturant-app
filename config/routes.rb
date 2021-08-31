Rails.application.routes.draw do
   root to:  'resturants#index'
  # get "/resturant/:id", to: "resturant#show"

   resources :resturants
   resources :orders
   resources :food_items
end
