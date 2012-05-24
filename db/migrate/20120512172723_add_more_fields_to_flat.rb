class AddMoreFieldsToFlat < ActiveRecord::Migration
  def change
    add_column :flats, :last_editor, :integer
    add_column :flats, :rent_status_id, :integer, :default => 0
  end
end
