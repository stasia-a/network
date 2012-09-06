class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :sender_id
      t.integer :user_id

      t.timestamps
    end
    add_index :posts, :user_id     
    add_index :posts, :sender_id
    add_index :posts, [:sender_id, :created_at]
  end
end
