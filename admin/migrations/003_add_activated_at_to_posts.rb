class AddActivatedAtToPosts < Sequel::Migration
  def up
    add_column :posts, :activated_at, :timestamp
  end

  def down
    drop_column :posts, :activated_at
  end
end