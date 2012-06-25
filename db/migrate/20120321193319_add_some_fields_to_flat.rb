class AddSomeFieldsToFlat < ActiveRecord::Migration
  def change
    add_column :flats, :kitch_space, :float
    add_column :flats, :full_space, :float
    add_column :flats, :wc, :integer
    add_column :flats, :owner_id, :integer
  end
end
