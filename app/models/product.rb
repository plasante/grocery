class Product < ActiveRecord::Base
  belongs_to :categorizable, polymorphic: true
  belongs_to :brand
  has_many :retailers_products
  has_many :products, through: :retailers_products
end
