class AddSomeFieldsToTenders < ActiveRecord::Migration
  def change
    add_column :tenders, :agent_id, :integer, :default => 0
    add_column :tenders, :client_status_id, :integer, :default => 0
    add_column :tenders, :comments, :string
  end
end
