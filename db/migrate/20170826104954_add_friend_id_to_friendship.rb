class AddFriendIdToFriendship < ActiveRecord::Migration[5.1]
  def change
        add_column :friendships, :friend_id, :integer,references: :users
  end
end
