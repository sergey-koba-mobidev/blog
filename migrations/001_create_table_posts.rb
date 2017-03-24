# migrations/001_create_table_posts.rb

class CreateTablePosts < Sequel::Migration
  def up
    create_table :posts do
      primary_key :id
      column :title, :text
      column :content, :text
      column :created_at, :timestamp
      column :updated_at, :timestamp
    end
  end

  def down
    drop_table :posts
  end
end