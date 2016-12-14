class AddUserIdToPostsAndComments < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :user_id, :integer    
    add_column :comments, :user_id, :integer
  end
end
