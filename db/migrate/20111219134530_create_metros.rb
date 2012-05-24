class CreateMetros < ActiveRecord::Migration
  def change
    create_table :metros do |t|
      t.string :name
      t.timestamps
    end
  end
end
