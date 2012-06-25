class CreateTenders < ActiveRecord::Migration
  def change
    create_table :tenders do |t|
      t.string :name
      t.string :phone
      t.integer :rooms_count
      t.string :metro
      t.float :price
      t.integer :operation
      t.text :description

      t.timestamps
    end
    add_index :tenders, :name
    add_index :tenders, :phone
    add_index :tenders, :rooms_count
    add_index :tenders, :metro
    add_index :tenders, :operation
  end
end
