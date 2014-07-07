class GroceryList < ActiveRecord::Base
  has_many :grocery_list_items
  has_many :products, through: :grocery_list_items
  belongs_to :user
end
