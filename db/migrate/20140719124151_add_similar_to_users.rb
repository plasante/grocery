class AddSimilarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :similar_allowed, :boolean, default: false
  end
end
