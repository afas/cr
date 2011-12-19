class CreateFlatImages < ActiveRecord::Migration
  def change
    create_table :flat_images do |t|
      t.integer :flat_id
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
    end
  end
end
