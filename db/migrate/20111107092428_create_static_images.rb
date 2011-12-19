class CreateStaticImages < ActiveRecord::Migration
  def change
    create_table :static_images do |t|
      t.integer :static_id
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
    end
  end
end
