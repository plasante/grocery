class RetailersProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :retailer
end
