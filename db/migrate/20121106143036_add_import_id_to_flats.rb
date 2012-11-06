class AddImportIdToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :import_id, :integer
  end
end
