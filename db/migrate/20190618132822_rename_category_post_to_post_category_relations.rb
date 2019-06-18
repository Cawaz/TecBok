class RenameCategoryPostToPostCategoryRelations < ActiveRecord::Migration[5.2]
  def change
    rename_table :category_posts, :post_category_relations
  end
end
