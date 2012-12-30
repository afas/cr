#encoding: utf-8
class AddFlatTypeToFlat < ActiveRecord::Migration
  def change
    remove_column :flats, :rent_type
    add_column :flats, :flat_type, :int, :default => 0
    add_column :flats, :country, :string, :default => "Российская Федерация"
    add_column :flats, :region, :string, :default => "Московская область"
    add_column :flats, :city, :string, :default => "Москва"
    add_column :flats, :district, :string
    add_column :tenders, :flat_type, :int, :default => 0
    add_column :tenders, :rent_period, :int, :default => 0
  end
end
