class AddInternalCommentsToFlat < ActiveRecord::Migration
  def change
    add_column :flats, :internal_comments, :string
  end
end
