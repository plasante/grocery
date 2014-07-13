class UpdateRetailers < ActiveRecord::Migration
  def change
    add_column :retailers, :no, :string
    add_column :retailers, :street, :string
    add_column :retailers, :city, :string
    add_column :retailers, :state, :string
    add_column :retailers, :country, :string, limit: 50
    add_column :retailers, :zip, :string, limit: 15
    add_column :retailers, :latitude, :string
    add_column :retailers, :longitude, :string
  end
end
