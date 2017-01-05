class AddLangToPosts < Sequel::Migration
  def up
    add_column :posts, :lang, String
  end

  def down
    drop_column :posts, :lang
  end
end