class GroceryListItem < ActiveRecord::Base
  belongs_to :grocery_list
  belongs_to :product
end
