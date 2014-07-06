class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many :sub_sub_categories
  has_many :products, as: :categorizable
end
