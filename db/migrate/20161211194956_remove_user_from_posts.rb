class RemoveUserFromPosts < ActiveRecord::Migration[5.0]
  def change
  end

  def up
    remove_column :posts, :user
  end
end
