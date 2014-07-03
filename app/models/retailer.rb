class Retailer < ActiveRecord::Base
  
  validates :name,  presence: true, length: { maximum: 100 }
  
  VALID_NAME_REGEX = /\A[a-zA-Z0-9'_.]+\z/i
  
  validates :name, format: { with: VALID_NAME_REGEX }
end
