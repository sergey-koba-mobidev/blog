class CreateTablePosts < Sequel::Migration
  def up
    create_table :posts do
      primary_key :id
      column :title, :text
      column :content, :text
      column :active, :boolean
      column :slug, :text
      column :seo_description, :text
      column :seo_keywords, :text
      column :tags, :text
      column :created_at, :timestamp
      column :updated_at, :timestamp
    end
  end

  def down
    drop_table :posts
  end
end