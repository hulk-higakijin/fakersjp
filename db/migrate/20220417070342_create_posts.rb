class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.integer :post_likes_count, default: 0
      t.integer :reposts_count, default: 0
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
