class AddFieldsToFlat < ActiveRecord::Migration
  def change
    add_column :flats, :agent_id, :integer
  end
end
