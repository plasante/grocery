class CreateSubSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_sub_categories do |t|
      t.string :name
      t.references :sub_category, index: true
      t.timestamps
    end
  end
end
