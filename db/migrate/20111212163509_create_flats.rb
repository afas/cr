class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.integer :rooms_count
      t.integer :rent_period
      t.integer :rent_type
      t.float :price
      t.integer :prepayment
      t.string :metro
      t.string :address
      t.integer :remote_type
      t.integer :remote_time
      t.integer :balkon
      t.float :living_space
      t.integer :floor
      t.integer :floor_count
      t.text :description
      t.boolean :approved, :default => false
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
