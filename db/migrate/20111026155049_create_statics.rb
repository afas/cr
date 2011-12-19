class CreateStatics < ActiveRecord::Migration
  def change
    create_table :statics do |t|
      t.string :title
      t.text :content
      t.integer :parent_id
      t.string :short_url
      t.string :menu
      t.string :seo_title
      t.string :seo_keywords
      t.string :seo_description

      t.string :preview_file_name
      t.string :preview_content_type
      t.integer :preview_file_size
      t.datetime :preview_updated_at

      t.timestamps
    end
  end
end
