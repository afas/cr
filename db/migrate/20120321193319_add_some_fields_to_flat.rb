class AddSomeFieldsToFlat < ActiveRecord::Migration
  def change
    add_column :flats, :kitch_space, :float
    add_column :flats, :full_space, :float
    add_column :flats, :wc, :integer
    add_column :flats, :renter_info, :string
  end
end
