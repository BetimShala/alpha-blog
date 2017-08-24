class RemoveLikesToArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles,:likes
  end
end
