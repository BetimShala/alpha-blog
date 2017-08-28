class AddUserIdToFriendship < ActiveRecord::Migration[5.1]
  def change
    add_column :friendships, :user_id, :integer

  end
end
