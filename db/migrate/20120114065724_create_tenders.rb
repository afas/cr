class CreateTenders < ActiveRecord::Migration
  def change
    create_table :tenders do |t|
      t.string :name
      t.string :phone
      t.integer :rooms_count
      t.string :metro
      #t.integer :metro
      t.float :price
      t.integer :operation
      t.text :description

      t.timestamps
    end
  end
end
