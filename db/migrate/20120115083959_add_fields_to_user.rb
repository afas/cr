class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :phone, :string
    add_column :users, :about, :string
    add_column :users, :role_id, :integer
    add_column :users, :organization, :string
    add_column :users, :internal, :boolean
  end
end
