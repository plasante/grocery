class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :brand, index: true
      t.text :description
      t.references :categorizable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
