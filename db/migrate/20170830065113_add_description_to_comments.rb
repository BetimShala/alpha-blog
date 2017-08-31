class AddDescriptionToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments,:description,:string
  end
end
