class RemoveColumnUserIdFromFriendships < ActiveRecord::Migration[5.1]
  def change
    remove_column :friendships, :user_id

  end
end
