class AddPostsToUser < ActiveRecord::Migration
  def change
    add_column :posts, :user, :reference, index: true, foreign_key: true
  end
end
