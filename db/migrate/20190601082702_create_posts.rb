class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :review, null: false
      t.integer :rate, null: false
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
