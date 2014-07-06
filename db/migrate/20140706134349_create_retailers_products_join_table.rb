class CreateRetailersProductsJoinTable < ActiveRecord::Migration
  def change
    create_table :retailers_products, id: false do |t|
      t.integer :retailer_id
      t.integer :product_id
      t.decimal :price, precision: 8, scale: 2
    end
    
    add_index :retailers_products, [:retailer_id, :product_id]
    add_index :retailers_products, [:product_id, :retailer_id]
  end
end
