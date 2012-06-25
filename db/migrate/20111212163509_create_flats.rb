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
      t.integer :agent_id

      t.timestamps
    end
    add_index :flats, :rooms_count
    add_index :flats, :rent_period
    add_index :flats, :rent_type
    add_index :flats, :metro
    add_index :flats, :remote_type
    add_index :flats, :floor
    add_index :flats, :floor_count
    add_index :flats, :approved
    add_index :flats, :agent_id
  end
end
