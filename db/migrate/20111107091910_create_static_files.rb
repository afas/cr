class CreateStaticFiles < ActiveRecord::Migration
  def change
    create_table :static_files do |t|
      t.integer :static_id
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at
    end
    add_index :static_files, :static_id
  end
end
