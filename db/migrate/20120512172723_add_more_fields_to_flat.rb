class AddMoreFieldsToFlat < ActiveRecord::Migration
  def change
    add_column :flats, :last_editor, :integer
    add_column :flats, :status_id, :integer, :default => 0
    add_column :flats, :status_id, :integer, :default => 0
  end
end
