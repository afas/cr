class AddPricingToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :rur, :float
    add_column :flats, :usd, :float
    add_column :flats, :street, :string
    add_column :flats, :building, :string
  end
end
