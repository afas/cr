class AddSomeFieldsToTenders < ActiveRecord::Migration
  def change
    add_column :tenders, :owner_id, :integer
    add_column :tenders, :agent_id, :integer, :default => 0
    add_column :tenders, :client_status_id, :integer, :default => 0
    add_column :tenders, :comments, :string

    add_index :tenders, :owner_id
    add_index :tenders, :agent_id
    add_index :tenders, :client_status_id
  end
end
