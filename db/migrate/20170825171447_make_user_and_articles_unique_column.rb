class MakeUserAndArticlesUniqueColumn < ActiveRecord::Migration[5.1]
  def change
    add_index :likes, [:user_id, :article_id], unique: true

  end
end
