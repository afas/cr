class CreateMetros < ActiveRecord::Migration
  def change
    create_table :metros do |t|
      t.string :name
      t.timestamps
    end
    add_index :metros, :name, :unique => true
  end
end
