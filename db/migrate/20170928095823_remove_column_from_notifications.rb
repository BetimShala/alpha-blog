class RemoveColumnFromNotifications < ActiveRecord::Migration[5.1]
  def change
    remove_column :notifications,:action_to
  end
end
