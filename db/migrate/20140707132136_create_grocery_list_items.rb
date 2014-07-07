class CreateGroceryListItems < ActiveRecord::Migration
  def change
    create_table :grocery_list_items do |t|
      t.references :grocery_list, index: true
      t.references :product,      index: true
      t.timestamps
    end
  end
end
