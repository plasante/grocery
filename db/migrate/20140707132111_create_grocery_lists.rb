class CreateGroceryLists < ActiveRecord::Migration
  def change
    create_table :grocery_lists do |t|
      t.references :user
      t.timestamps
    end
  end
end
