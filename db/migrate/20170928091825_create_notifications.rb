class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :action_by
      t.integer :action_to
      t.string  :action_map_url
      t.string  :action_type
      t.boolean :checked,default: false
      t.boolean :available,default: true
      t.timestamps
    end
  end
end
